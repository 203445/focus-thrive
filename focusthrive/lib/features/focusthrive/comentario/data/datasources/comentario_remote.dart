import 'dart:convert';

import 'package:focusthrive/features/focusthrive/comentario/domain/entities/comentario.dart'
    as ent;
import 'package:dio/dio.dart';

final dio = Dio();

abstract class ComentarioRemoteDataSource {
  Future<ent.Comentario?> createComentario(
      String idP, String idDoc, String descripcion);
  Future<List<ent.Comentario?>> listComentario(String idDoc);
}

class ComentarioRemoteDataSourceImp implements ComentarioRemoteDataSource {
  @override
  Future<ent.Comentario?> createComentario(
      String idP, String idDoc, String descripcion) async {
    Map<String, dynamic> data = {
      "id_doctor": idDoc,
      "id_paciente": idP,
      "descripcion": descripcion,
    };

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

  @override
  Future<List<ent.Comentario?>> listComentario(String idDoc) async {
    print('duncion del remote');
    print(idDoc);
    Map<String, dynamic> data = {
      "id_doctor": idDoc,
    };
    print(data);
    final response = await dio.post("http://44.217.4.1/comentario/lista",
        data: jsonEncode(data));
    print(response);

    if (response.statusCode == 200) {
      print('Datos recibidos: ${response.data}');
      List<dynamic> jsonList = response.data;
      List<ent.Comentario> consejoList =
          jsonList.map((jsonMap) => ent.Comentario.fromJson(jsonMap)).toList();

      return consejoList;
    } else {
      print('Error: ${response.statusCode}, ${response.statusMessage}');
      return [];
    }
  }
}
