import 'package:flutter/foundation.dart';

import '../../domain/usecases/delete_tarea_usecases.dart';

class DeleteTareaProvider extends ChangeNotifier {
  final DeleteTareaUseCase deleteTareaUseCase;
  bool confirm = false;
  DeleteTareaProvider({required this.deleteTareaUseCase});

  Future<void> delteTarea(String id) async {
    confirm = await deleteTareaUseCase.execute(id);
    if (confirm) {
      notifyListeners();
    } else {
      print('algo falló');
    }
  }
}
