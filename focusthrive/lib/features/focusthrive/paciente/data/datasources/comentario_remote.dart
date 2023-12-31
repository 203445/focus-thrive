import 'dart:convert';

import 'package:focusthrive/features/focusthrive/paciente/domain/entities/comentario.dart'
    as ent;
import 'package:dio/dio.dart';

final dio = Dio();

abstract class ComentarioRemoteDataSource {
  Future<ent.Comentario?> createComentario(
      String idP, String idDoc, String descripcion);
}

class ComentarioRemoteDataSourceImp implements ComentarioRemoteDataSource {
  @override
  Future<ent.Comentario?> createComentario(
      String idP, String idDoc, String descripcion) async {
    Map<String, dynamic> data = {
      "id_doctor": idP,
      "id_paciente": idDoc,
      "descripcion": descripcion,
    };
    // final response = await dio.post("$apiURI/create", data: formData);
    final response = await dio.post("http://44.217.4.1/comentario/create",
        data: jsonEncode(data));
    print(response);
    if (response.statusCode == 200) {
      return ent.Comentario(
        idDoctor: response.data['id_doctor'].toString(),
        idPaciente: response.data['id_paciente'].toString(),
        description: response.data['descripcion'].toString(),
      );
    }
    return null;
  }
}
