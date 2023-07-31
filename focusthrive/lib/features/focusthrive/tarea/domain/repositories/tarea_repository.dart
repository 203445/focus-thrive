import 'package:focusthrive/features/focusthrive/tarea/domain/entities/tarea.dart';

abstract class TareaRepository {
  Future<Tarea?> createTarea(String titulo, String description,
      String fechaInicio, String fechaFinal, String userId, String status);
  Future<List<Tarea>> getTarea(String id);
  Future<bool> deleteTarea(String id);
  Future<bool> updateTarea(String id, String status);
}
