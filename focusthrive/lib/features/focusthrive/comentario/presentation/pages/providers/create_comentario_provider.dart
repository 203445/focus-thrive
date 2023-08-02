import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/comentario/domain/usecases/create_comentario_usecases.dart';

import '../../../domain/entities/comentario.dart';

class CreateComentarioProvider extends ChangeNotifier {
  final CreateComentarioUseCase createComentarioUseCase;

  CreateComentarioProvider({required this.createComentarioUseCase});
  Comentario? comentario;

  Future<void> createComentario(
      String idP, String idDoc, String descripcion) async {
    comentario = await createComentarioUseCase.execute(idP, idDoc, descripcion);
    if (comentario != null) {
      notifyListeners();
    } else {
      print('No se puede comentar');
    }
  }
}
