import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart'
    as ent;
import 'package:dio/dio.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/bloc/paciente_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path_provider/path_provider.dart';

final dio = Dio();

String apiURI = 'http://54.147.89.61';

Future<File> getImageFileFromAssets() async {
  const String path = 'img/default-user.png';
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory())}');
  await file.create(recursive: true);
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

abstract class PacienteRemoteDataSource {
  // Future<bool> verifyExistence(String email);
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
  // Future<bool> updateProfile(String id, String name, String data, File? img);
  // Future<ent.User?> getUser(String id);
  // Future<ent.User?> getFireId(String idFirebase);
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
    // Imprime el contenido del FormData
    // formData.fields.forEach((entry) {
    //   print("${entry.key}: ${entry.value}");
    // });

    final response = await dio.post("$apiURI/create", data: formData);
    print(response.data);

    return response.data;
  }

  @override
  Future<ent.Paciente?> getPaciente(String id) async {
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImRhOWY0ZTg4LTE2OGUtNDg5ZS04N2IxLTMzZTAyMTFkZTAxOCIsImlhdCI6MTY5MDE3MzI2NywiZXhwIjoxNjkwMjA5MjY3fQ.rVkcsM_sL7OCsev69S2rHkF54EiYzX0Cl2yJ4XdMcNc';

    Map<String, dynamic> data = {
      "id": id,
    };

    final response = await dio.get(
      "$apiURI/cliente/get ",
      data: jsonEncode(data),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    // Comprueba si la solicitud fue exitosa
    if (response.statusCode == 200) {
      // Procesa los datos aquí si es necesario
      print('Datos recibidos: ${response.data}');
    } else {
      // Si la solicitud no fue exitosa, muestra el código de estado y el mensaje de error
      print('Error: ${response.statusCode}, ${response.statusMessage}');
    }
    return response.data;
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

        if (token != null && token.isNotEmpty) {
          // Guardar el token en SharedPreferences
          await sharedPreferences.setString('user_token', token);
          // Guardar en local_Storage si es necesario
          return true;
        }
      }
    } catch (e) {
      print('Error en la solicitud: $e');
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
}
