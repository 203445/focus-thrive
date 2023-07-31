import 'package:focusthrive/features/focusthrive/comentario/domain/entities/comentario.dart';

abstract class ComentarioRepository {
  Future<Comentario?> createComentario(
      String idP, String idDoc, String descripcion);
  Future<Comentario?> listComentario(String idDoc);
}
