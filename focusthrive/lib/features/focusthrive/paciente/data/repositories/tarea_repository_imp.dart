import 'package:focusthrive/features/focusthrive/paciente/data/datasources/tarea_remote.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/tarea.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/tarea_repository.dart';

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
}
