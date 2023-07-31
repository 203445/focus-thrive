import '../repositories/comentario_repository.dart';
import 'package:focusthrive/features/focusthrive/comentario/domain/entities/comentario.dart';

class ListComentarioUseCase {
  final ComentarioRepository comentarioRepository;

  ListComentarioUseCase(this.comentarioRepository);

  Future<Comentario?> execute(String idDoc) async {
    return await comentarioRepository.listComentario(idDoc);
  }
}
