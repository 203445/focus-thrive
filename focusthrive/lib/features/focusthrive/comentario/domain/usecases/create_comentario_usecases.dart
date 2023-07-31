import '../repositories/comentario_repository.dart';
import 'package:focusthrive/features/focusthrive/comentario/domain/entities/comentario.dart';

class CreateComentarioUseCase {
  final ComentarioRepository comentarioRepository;

  CreateComentarioUseCase(this.comentarioRepository);

  Future<Comentario?> execute(
      String idP, String idDoc, String descripcion) async {
    return await comentarioRepository.createComentario(idP, idDoc, descripcion);
  }
}
