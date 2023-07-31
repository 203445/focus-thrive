import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart'
    as ent;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path_provider/path_provider.dart';

final dio = Dio();

String apiURI = 'http://54.147.89.61';

Future<File> getImageFileFromAssets() async {
  const String path = 'img/default-user.png';
  final byteData = await rootBundle.load('assets/$path');

  final file = File("${(await getTemporaryDirectory()).path}/$path");
  await file.create(recursive: true);
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

abstract class PacienteRemoteDataSource {
  Future<bool> createProfile(
      String nombre,
      String apellido,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta);

  Future<ent.Paciente?> getPaciente(String id);
  Future<bool> loginPaciente(String correo, String password);
  Future<void> cerrarSesion();
  Future<bool> updatePaciente(String id, String name, String apellido,
      String email, String telefono, String descripcion);
  Future<bool> undoPlanPaciente(String id);
  Future<bool> updatePlanPaciente(String id);
}

class PacienteRemoteDataSourceImp implements PacienteRemoteDataSource {
  @override
  Future<bool> createProfile(
      String nombre,
      String apellido,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta) async {
    FormData formData;

    if (urlFoto != null) {
      formData = FormData.fromMap({
        "nombre": nombre,
        "apellidos": apellido,
        "telefono": telefono,
        "passw": contrasena,
        "image": await MultipartFile.fromFile(urlFoto.path,
            filename: urlFoto.path.split('/').last),
        "correo": correo,
      });
    } else {
      final File defaultImage = await getImageFileFromAssets();
      formData = FormData.fromMap({
        "nombre": nombre,
        "apellidos": apellido,
        "telefono": telefono,
        "passw": contrasena,
        "image": await MultipartFile.fromFile(defaultImage.path,
            filename: defaultImage.path.split('/').last),
        "correo": correo,
      });
    }
    print('hola');
    print(formData.toString);

    final response =
        await dio.post("http://54.147.89.61/cliente/create", data: formData);
    print(response.data);

    return response.data;
  }

  @override
  Future<ent.Paciente?> getPaciente(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('user_token_P');

    final response = await dio.get(
      "http://54.147.89.61/cliente/get",
      options: Options(
        headers: {
          'Authorization': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Datos recibidos: ${response.data}');

      // Convierte el JSON del paciente a un objeto ent.Paciente
      ent.Paciente paciente = ent.Paciente.fromJson(response.data);
      return paciente;
    } else {
      print('Error: ${response.statusCode}, ${response.statusMessage}');
      return null;
    }
  }

  @override
  Future<bool> loginPaciente(String correo, String password) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    Map<String, dynamic> data = {
      "passw": password,
      "correo": correo,
    };

    try {
      final response = await dio.post("http://54.147.89.61/cliente/login",
          data: jsonEncode(data));

      if (response.statusCode == 200) {
        var token = response.data["token"];
        // print(token);

        if (token != null && token.isNotEmpty) {
          // Guardar el token en SharedPreferences
          await sharedPreferences.setString('user_token_P', token);
          // Guardar en local_Storage si es necesario

          return true;
        }
      }
      // return false;
    } catch (e) {
      if (e is DioException) {
        // Si es un error de Dio (por ejemplo, tiempo de espera agotado)
        if (e.type == DioExceptionType.connectionTimeout) {
          print("Error: Tiempo de conexión agotado.");
        } else if (e.type == DioExceptionType.badResponse) {
          print(
              "Error: Respuesta no válida del servidor ${e.response?.statusCode} ${e.response?.statusMessage}");
        } else {
          print("Error: $e");
        }
      } else {
        // Otras excepciones que no sean de Dio
        print("Error: $e");
      }
    }

    return false;
  }

  @override
  Future<void> cerrarSesion() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove('user_token');

    print(sharedPreferences.get('user_token'));
  }

  @override
  Future<bool> undoPlanPaciente(String id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('user_token_P');
    Map<String, dynamic> data = {
      "id": id,
    };

    try {
      final response = await dio.get(
        "http://54.147.89.61/cliente/undoTopremium",
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Datos recibidos: ${response.data}');
        if (response.data == true) return true;
      } else {
        print('Error: ${response.statusCode}, ${response.statusMessage}');
        return false;
      }
      // return false;
    } catch (e) {
      if (e is DioException) {
        // Si es un error de Dio (por ejemplo, tiempo de espera agotado)
        if (e.type == DioExceptionType.connectionTimeout) {
          print("Error: Tiempo de conexión agotado.");
        } else if (e.type == DioExceptionType.badResponse) {
          print(
              "Error: Respuesta no válida del servidor ${e.response?.statusCode} ${e.response?.statusMessage}");
        } else {
          print("Error: $e");
        }
      } else {
        // Otras excepciones que no sean de Dio
        print("Error: $e");
      }
    }

    return false;
  }

  @override
  Future<bool> updatePaciente(String id, String name, String apellido,
      String email, String telefono, String descripcion) async {
    Map<String, dynamic> data = {
      "nombre": name,
      "apellidos": apellido,
      "telefono": telefono,
      "id": id,
    };

    try {
      final response = await dio.get(
        "http://54.147.89.61/cliente/update",
        data: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print('Datos recibidos: ${response.data}');
        if (response.data == true) return true;
      } else {
        print('Error: ${response.statusCode}, ${response.statusMessage}');
        return false;
      }
      // return false;
    } catch (e) {
      if (e is DioException) {
        // Si es un error de Dio (por ejemplo, tiempo de espera agotado)
        if (e.type == DioExceptionType.connectionTimeout) {
          print("Error: Tiempo de conexión agotado.");
        } else if (e.type == DioExceptionType.badResponse) {
          print(
              "Error: Respuesta no válida del servidor ${e.response?.statusCode} ${e.response?.statusMessage}");
        } else {
          print("Error: $e");
        }
      } else {
        // Otras excepciones que no sean de Dio
        print("Error: $e");
      }
      return false;
    }
    return false;
  }

  @override
  Future<bool> updatePlanPaciente(String id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('user_token_P');
    Map<String, dynamic> data = {
      "id": id,
    };

    try {
      final response = await dio.get(
        "http://54.147.89.61/cliente/updateTopremium",
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Datos recibidos: ${response.data}');
        if (response.data == true) return true;
      } else {
        print('Error: ${response.statusCode}, ${response.statusMessage}');
        return false;
      }
      // return false;
    } catch (e) {
      if (e is DioException) {
        // Si es un error de Dio (por ejemplo, tiempo de espera agotado)
        if (e.type == DioExceptionType.connectionTimeout) {
          print("Error: Tiempo de conexión agotado.");
        } else if (e.type == DioExceptionType.badResponse) {
          print(
              "Error: Respuesta no válida del servidor ${e.response?.statusCode} ${e.response?.statusMessage}");
        } else {
          print("Error: $e");
        }
      } else {
        // Otras excepciones que no sean de Dio
        print("Error: $e");
      }
      return false;
    }
    return false;
  }
}
