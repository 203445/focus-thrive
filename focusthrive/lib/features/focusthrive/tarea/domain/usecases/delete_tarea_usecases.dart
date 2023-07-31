import 'package:focusthrive/features/focusthrive/tarea/domain/repositories/tarea_repository.dart';

class DeleteTareaUseCase {
  final TareaRepository tareaRepository;

  DeleteTareaUseCase(this.tareaRepository);

  Future<bool> execute(
    String id,
  ) async {
    return await tareaRepository.deleteTarea(id);
  }
}
