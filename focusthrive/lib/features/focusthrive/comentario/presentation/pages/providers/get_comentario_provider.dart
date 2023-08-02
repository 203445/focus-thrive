import 'package:flutter/foundation.dart';

import '../../../domain/entities/comentario.dart';
import '../../../domain/usecases/list_comentario_usecases.dart';

class GetComentarioProvider extends ChangeNotifier {
  final ListComentarioUseCase listComentarioUseCase;

  GetComentarioProvider({required this.listComentarioUseCase});
  List<Comentario>? comentario;

  Future<void> listComentario(
    String idDoc,
  ) async {
    comentario =
        (await listComentarioUseCase.execute(idDoc)).cast<Comentario>();
    if (comentario != []) {
      notifyListeners();
    } else {
      print('No se han registrado comentarios');
    }
  }
}
