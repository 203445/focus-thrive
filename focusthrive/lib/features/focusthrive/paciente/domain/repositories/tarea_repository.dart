import 'package:focusthrive/features/focusthrive/paciente/domain/entities/tarea.dart';

abstract class TareaRepository {
  Future<Tarea?> createTarea(String titulo, String description,
      String fechaInicio, String fechaFinal, String userId, String status);
  Future<List<Tarea>> getTarea(String id);
 
}
