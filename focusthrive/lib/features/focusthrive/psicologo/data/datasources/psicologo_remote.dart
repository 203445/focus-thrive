import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart'
    as ent;
import 'package:dio/dio.dart';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dio = Dio();

Future<File> getImageFileFromAssets() async {
  const String path = 'img/default-user.png';
  final byteData = await rootBundle.load('assets/$path');

  final file = File("${(await getTemporaryDirectory()).path}/$path");
  await file.create(recursive: true);
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

abstract class PsicologoRemoteDataSource {
  Future<bool> createProfile(
    String nombre,
    String apellidos,
    String telefono,
    String contrasena,
    File? urlFoto,
    String descripcion,
    String ubicacion,
    String numerotarjeta,
    String correo,
    String rating,
  );
  Future<bool> loginPsicologo(String correo, String password);
  Future<ent.Psicologo?> getPsicologo();
  Future<List<ent.Psicologo?>> getAllPsicologos();
}

class PsicologoRemoteDataSourceImp implements PsicologoRemoteDataSource {
  @override
  Future<bool> createProfile(
    String nombre,
    String apellidos,
    String telefono,
    String contrasena,
    File? urlFoto,
    String descripcion,
    String ubicacion,
    String numerotarjeta,
    String correo,
    String rating,
  ) async {
    FormData formData;

    if (urlFoto != null) {
      formData = FormData.fromMap({
        "nombre": nombre,
        "apellidos": apellidos,
        "telefono": telefono,
        "passw": contrasena,
        "image": await MultipartFile.fromFile(urlFoto.path,
            filename: urlFoto.path.split('/').last),
        "descripcion": descripcion,
        "ubicacion": ubicacion,
        "ntarjeta": numerotarjeta,
        "correo": correo,
        "rating": rating,
      });
    } else {
      final File defaultImage = await getImageFileFromAssets();
      formData = FormData.fromMap({
        "nombre": nombre,
        "apellidos": apellidos,
        "telefono": telefono,
        "passw": contrasena,
        "image": await MultipartFile.fromFile(defaultImage.path,
            filename: defaultImage.path.split('/').last),
        "descripcion": descripcion,
        "ubicacion": ubicacion,
        "ntarjeta": numerotarjeta,
        "correo": correo,
        "rating": rating,
      });
    }
    final response =
        await dio.post("http://54.83.165.193/psicologo/create", data: formData);

    if (response.data == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> loginPsicologo(String correo, String password) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    Map<String, dynamic> data = {
      "passw": password,
      "correo": correo,
    };

    try {
      final response = await dio.post("http://54.83.165.193/psicologo/login",
          data: jsonEncode(data));

      if (response.statusCode == 200) {
        var token = response.data["token"];
        print(token);

        if (token != null && token.isNotEmpty) {
          // Guardar el token en SharedPreferences
          await sharedPreferences.setString('user_token', token);
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
  Future<ent.Psicologo?> getPsicologo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('user_token');
    final response = await dio.get(
      "http://54.83.165.193/psicologo/get",
      options: Options(
        headers: {
          'Authorization': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      // Convierte el JSON del psicologo a un objeto ent.Paciente
      ent.Psicologo psicologo = ent.Psicologo.fromJson(response.data);

      return psicologo;
    } else {
      print('Error: ${response.statusCode}, ${response.statusMessage}');
    }
    return null;
  }

  @override
  Future<List<ent.Psicologo?>> getAllPsicologos() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('user_token');

    final response = await dio.get(
      "http://54.83.165.193/psicologo/get",
      options: Options(
        headers: {
          'Authorization': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = response.data;
      List<ent.Psicologo> psicologoList = [];

      // Verifica si la respuesta es un objeto JSON
      if (jsonData is Map<String, dynamic>) {
        ent.Psicologo psicologo = ent.Psicologo(
          id: jsonData['id'].toString(),
          nombre: jsonData['nombre'].toString(),
          apellidos: jsonData['apellidos'].toString(),
          correo: jsonData['correo'].toString(),
          contrasena: jsonData['passw'].toString(),
          numerotarjeta: jsonData['ntarjeta'].toString(),
          telefono: jsonData['telefono'].toString(),
          urlFoto: jsonData['image'].toString(),
          rating: jsonData['raiting'],
          description: jsonData['descripcion'].toString(),
          ubicacion: jsonData['ubicacion'].toString(),
        );
        psicologoList.add(psicologo);
      } else {
        print('Uno de los elementos no es un JSON válido.');
      }

      return psicologoList;
    }
    return [];
  }
}
