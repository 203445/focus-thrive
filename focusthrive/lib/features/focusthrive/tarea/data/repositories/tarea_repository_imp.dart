import 'package:focusthrive/features/focusthrive/tarea/data/datasources/tarea_remote.dart';
import 'package:focusthrive/features/focusthrive/tarea/domain/entities/tarea.dart';
import 'package:focusthrive/features/focusthrive/tarea/domain/repositories/tarea_repository.dart';

class TareaRepositoryImp implements TareaRepository {
  final TareaRemoteDataSource tareaRemoteDataSource;

  TareaRepositoryImp({required this.tareaRemoteDataSource});

  @override
  Future<Tarea?> createTarea(
      String titulo,
      String description,
      String fechaInicio,
      String fechaFinal,
      String userId,
      String status) async {
    return await tareaRemoteDataSource.createTarea(
        titulo, description, fechaInicio, fechaFinal, userId, status);
  }

  @override
  Future<List<Tarea>> getTarea(String id) async {
    return await tareaRemoteDataSource.getTarea(id);
  }

  @override
  Future<bool> deleteTarea(String id) async {
    return await tareaRemoteDataSource.deleteTarea(id);
  }

  @override
  Future<bool> updateTarea(String id, String status) async {
    return await tareaRemoteDataSource.updateTarea(id, status);
  }
}
