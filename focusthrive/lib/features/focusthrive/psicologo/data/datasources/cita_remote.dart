import 'dart:convert';
import 'dart:io';

import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/cita.dart'
    as ent;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dio = Dio();

abstract class CitaRemoteDataSource {
  Future<ent.Cita?> createCita(
      String nombreD,
      String nombreP,
      String motivo,
      String status,
      String horario,
      String recomendaciones,
      String idDoctor,
      String idPaciente);
  Future<List<ent.Cita?>> getCita(String id);
  Future<bool> deleteCita(String id);
}

class CitaRemoteDataSourceImp implements CitaRemoteDataSource {
  @override
  Future<ent.Cita?> createCita(
      String nombreD,
      String nombreP,
      String motivo,
      String status,
      String horario,
      String recomendaciones,
      String idDoctor,
      String idPaciente) async {
    Map<String, dynamic> data = {
      "nombre_doctor": nombreD,
      "nombre_paciente": nombreP,
      "motivo": motivo,
      "status": status,
      "horario": horario,
      "recomendaciones": recomendaciones,
      "id_doctor": idDoctor,
      "id_usuario": idPaciente
    };

    final response = await dio.post("http://54.146.114.123/cita/create",
        data: jsonEncode(data));

    print(response);
    if (response.statusCode == 200) {
      return ent.Cita(
          nombreD: response.data['nombre_doctor'].toString(),
          nombreP: response.data['nombre_paciente'].toString(),
          motivo: response.data['motivo'].toString(),
          status: response.data['status'].toString(),
          horario: response.data['horario'].toString(),
          recomendaciones: response.data['recomendaciones'],
          idDoctor: response.data['id_doctor'].toString(),
          idPaciente: response.data['id_usuario'].toString());
    } else {
      print('Error: ${response.statusCode}, ${response.statusMessage}');

      return null;
    }
  }

  @override
  Future<List<ent.Cita?>> getCita(String id) async {
    Map<String, dynamic> data = {
      "id_doctor": id,
    };

    final response = await dio.post("http://54.146.114.123/cita/lista",
        data: jsonEncode(data));

    if (response.statusCode == 200) {
      print('Datos recibidos: ${response.data}');
      // Decodifica la respuesta JSON a una lista de mapas (objetos JSON)
      List<dynamic> jsonList = response.data;

      // Convierte la lista de mapas a una lista de objetos Consejo
      List<ent.Cita> citaList =
          jsonList.map((jsonMap) => ent.Cita.fromJson(jsonMap)).toList();

      return citaList;
    } else {
      print('Error: ${response.statusCode}, ${response.statusMessage}');

      return [];
    }
  }

  @override
  Future<bool> deleteCita(String id) async {
    Map<String, dynamic> data = {
      "id": id,
    };

    final response = await dio.post("http://54.146.114.123/cita/delete",
        data: jsonEncode(data));

    if (response.data == true) {
      return true;
    } else {
      return false;
    }
  }
}
