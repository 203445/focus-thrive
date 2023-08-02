import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/entities/solicitudes.dart' as ent;

final dio = Dio();

abstract class SolicitudRemoteDataSource {
  Future<ent.SolicitudesC?> createSolicitud(
    String nombreP,
    String correo,
    String motivo,
    String idPaciente,
  );
  Future<List<ent.SolicitudesC?>> listSolicitud();
}

class SolicitudRemoteDataSourceImp implements SolicitudRemoteDataSource {
  @override
  Future<ent.SolicitudesC?> createSolicitud(
      String nombreP, String correo, String motivo, String idPaciente) async {
    Map<String, dynamic> data = {
      "nombre_usuario": nombreP,
      "correo": correo,
      "motivo": motivo,
      "id_usuario": idPaciente,
    };

    final response = await dio.post("http://44.217.14.233/consulta/create",
        data: jsonEncode(data));

    print(response);
    if (response.statusCode == 200) {
      return ent.SolicitudesC(
        id: response.data['id'].toString(),
        nombreUsuario: response.data['nombre_usuario'].toString(),
        correo: response.data['correo'].toString(),
        motivo: response.data['motivo'].toString(),
        idUsuario: response.data['id_usuario'].toString(),
      );
    }
    return null;
  }

  @override
  Future<List<ent.SolicitudesC?>> listSolicitud() async {
    final response = await dio.get("http://44.217.14.233/consulta/lista");
    if (response.statusCode == 200) {
      if (response.data == null) {
        return [];
      }
      List<dynamic> jsonList = response.data;

      List<ent.SolicitudesC> tarealist = jsonList
          .map((jsonMap) => ent.SolicitudesC.fromJson(jsonMap))
          .toList();
      return tarealist;
    }
    return [];
  }
}
