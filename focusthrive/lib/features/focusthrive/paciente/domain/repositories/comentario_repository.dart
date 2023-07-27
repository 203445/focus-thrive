import 'package:focusthrive/features/focusthrive/paciente/domain/entities/comentario.dart';

abstract class ComentarioRepository {
  Future<Comentario?> createComentario(
      String idP, String idDoc, String descripcion);
}
