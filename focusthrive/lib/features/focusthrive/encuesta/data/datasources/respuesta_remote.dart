import 'dart:convert';
import 'package:focusthrive/features/focusthrive/cita/domain/entities/cita.dart'
    as ent;
import 'package:dio/dio.dart';

final dio = Dio();

abstract class RespuestaRemoteDataSource {
  // Future<ent.Cita?> createCita(
  //     String nombreD,
  //     String nombreP,
  //     String motivo,
  //     String status,
  //     String horario,
  //     String recomendaciones,
  //     String idDoctor,
  //     String idPaciente);

  Future<bool> getRespuesta(String id);
}

class RespuestaRemoteDataSourceImp implements RespuestaRemoteDataSource {
  @override
  Future<bool> getRespuesta(
    String id,
  ) async {
    Map<String, dynamic> data = {"id_usuario": id};

    final response = await dio.post("http://54.209.71.163/respuesta/verify",
        data: jsonEncode(data));
    print(response.data);
    if (response.data == true) {
      return true;
    } else {
      return false;
    }
  }
}
