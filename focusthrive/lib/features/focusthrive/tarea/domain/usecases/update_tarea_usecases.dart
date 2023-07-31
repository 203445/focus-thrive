import 'package:focusthrive/features/focusthrive/tarea/domain/repositories/tarea_repository.dart';

class UpdateTareaUseCase {
  final TareaRepository tareaRepository;

  UpdateTareaUseCase(this.tareaRepository);

  Future<bool> execute(String id, String status) async {
    return await tareaRepository.updateTarea(id, status);
  }
}
