import 'package:focusthrive/features/focusthrive/paciente/domain/entities/tarea.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/tarea_repository.dart';

class CreateTareaUseCase {
  final TareaRepository tareaRepository;

  CreateTareaUseCase(this.tareaRepository);

  Future<Tarea?> execute(String titulo, String description, String fechaInicio,
      String fechaFinal, String userId, String status) async {
    return await tareaRepository.createTarea(titulo, description, fechaInicio, fechaFinal, userId, status);
  }
}
