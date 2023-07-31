import 'package:focusthrive/features/focusthrive/tarea/domain/entities/tarea.dart';
import 'package:focusthrive/features/focusthrive/tarea/domain/repositories/tarea_repository.dart';

class GetTareaUseCase {
  final TareaRepository tareaRepository;

  GetTareaUseCase(this.tareaRepository);

  Future<List<Tarea>> execute(String id) async {
    return await tareaRepository.getTarea(id);
  }
}
