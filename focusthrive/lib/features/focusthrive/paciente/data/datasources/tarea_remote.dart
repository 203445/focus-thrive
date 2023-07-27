import 'dart:convert';

import 'package:focusthrive/features/focusthrive/paciente/domain/entities/tarea.dart'
    as ent;
import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

final dio = Dio();

String apiURI = 'http://23.22.105.14/tarea';

abstract class TareaRemoteDataSource {
  Future<ent.Tarea?> createTarea(String titulo, String description,
      String fechaInicio, String fechaFinal, String userId, String status);

  Future<List<ent.Tarea>> getTarea(String id);

  Future<bool> deleteTarea(String id);
}

class TareaRemoteDataSourceImp implements TareaRemoteDataSource {
  @override
  Future<ent.Tarea?> createTarea(
      String titulo,
      String description,
      String fechaInicio,
      String fechaFinal,
      String userId,
      String status) async {
    Map<String, dynamic> data = {
      "titulo": titulo,
      "descripcion": description,
      "fecha_inicio": fechaInicio,
      "fecha_fin": fechaFinal,
      "user_id": userId,
      "status": status,
    };
    // final response = await dio.post("$apiURI/create", data: formData);
    final response = await dio.post("$apiURI/create", data: jsonEncode(data));

    print(response);
    if (response.statusCode == 200) {
      return ent.Tarea(
          id: response.data['id'].toString(),
          titulo: response.data['titulo'].toString(),
          description: response.data['description'].toString(),
          fechaInicio: response.data['fecha_inicio'].toString(),
          fechaFinal: response.data['fecha_fin'].toString(),
          userId: response.data['fecha_fin'].toString(),
          status: response.data['status'].toString());
    }
    return null;
  }

  @override
  Future<List<ent.Tarea>> getTarea(String id) async {
    Map<String, dynamic> data = {
      "id": 1,
    };
    final response = await dio.post(
      "http://23.22.105.14/tarea/get",
      data: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      List<ent.Tarea> tarealist = [];

      List<dynamic> jsonList = response.data;

      for (var jsonTarea in jsonList) {
        tarealist.add(ent.Tarea(
          id: jsonTarea['id'].toString(),
          titulo: jsonTarea['titulo'].toString(),
          description: jsonTarea['descripcion'].toString(),
          fechaInicio: jsonTarea['fecha_inicio'].toString(),
          fechaFinal: jsonTarea['fecha_fin'].toString(),
          userId: jsonTarea['user_id'].toString(),
          status: jsonTarea['status'].toString(),
        ));
      }
      return tarealist;
    }
    return [];
  }

  @override
  Future<bool> deleteTarea(String id) async {
    Map<String, dynamic> data = {
      "id": id,
    };
    final response = await dio.post(
      "http://23.22.105.14/tarea/delete",
      data: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      if (response.data == true) {
        print('Se eliminó correctamente');
        return response.data;
      } else {
        print('no se puede eliminar correctamente');
        return response.data;
      }
    }
    return false;
  }
}
