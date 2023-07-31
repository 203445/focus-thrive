import 'dart:convert';

import 'package:focusthrive/features/focusthrive/consejo/domain/entities/consejo.dart'
    as ent;

import 'package:dio/dio.dart';

final dio = Dio();

abstract class ConsejoRemoteDataSource {
  Future<List<ent.Consejo?>> getConsejo(String id);
}

class ConsejoRemoteDataSourceImp implements ConsejoRemoteDataSource {
  @override
  Future<List<ent.Consejo?>> getConsejo(String id) async {
    Map<String, dynamic> data = {
      "id": id,
    };

    final response = await dio.get(
      "http://44.217.125.134/consejo/list",
      data: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Datos recibidos: ${response.data}');
      // Decodifica la respuesta JSON a una lista de mapas (objetos JSON)
      List<dynamic> jsonList = response.data;

      // Convierte la lista de mapas a una lista de objetos Consejo
      List<ent.Consejo> consejoList =
          jsonList.map((jsonMap) => ent.Consejo.fromJson(jsonMap)).toList();

      for (var consejo in consejoList) {
        print("ID: ${consejo.id}");
        print("Descripción: ${consejo.description}");
      }
      return consejoList;
    } else {
      print('Error: ${response.statusCode}, ${response.statusMessage}');

      return [];
    }
  }
}