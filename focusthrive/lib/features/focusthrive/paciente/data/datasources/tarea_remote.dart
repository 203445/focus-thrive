import 'dart:convert';

import 'package:focusthrive/features/focusthrive/paciente/domain/entities/tarea.dart'
    as ent;
import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

final dio = Dio();

String apiURI = 'http://23.22.105.14/tarea';

abstract class TareaRemoteDataSource {
  // Future<bool> verifyExistence(String email);
  Future<ent.Tarea?> createTarea(String titulo, String description,
      String fechaInicio, String fechaFinal, String userId, String status);
  // Future<bool> addContact(String email, String id);
  Future<List<ent.Tarea>> getTarea(String id);

  // Future<List<ent.User>> getContacts(String id);
  // Future<bool> updateProfile(String id, String name, String data, File? img);
  // Future<ent.User?> getUser(String id);
  // Future<ent.User?> getFireId(String idFirebase);
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
    // FormData formData;

    // formData = FormData.fromMap({
    //   "titulo": titulo,
    //   "descripcion": description,
    //   "fecha_inicio": fechaInicio,
    //   "fecha_fin": fechaFinal,
    //   "user_id": userId,
    //   "status": status,
    // });
    // Imprime el contenido del FormData
    // formData.fields.forEach((entry) {
    //   print("${entry.key}: ${entry.value}");
    // });
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
      "id": id,
    };
    final response = await dio.get(
      "$apiURI/get/",
      data: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      List<ent.Tarea> contactsList = [];
      var contacts = response.data['contacts'];

      if (contacts.length > 0) {
        for (var object in contacts) {
          contactsList.add(ent.Tarea(
              id: object['id'].toString(),
              titulo: object['titulo'].toString(),
              description: object['description'].toString(),
              fechaInicio: object['fecha_inicio'].toString(),
              fechaFinal: object['fecha_fin'].toString(),
              userId: object['user_id'].toString(),
              status: object['status'].toString()));
        }
      }
      return contactsList;
    }
    return [];
  }

  
}
