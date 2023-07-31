import 'package:flutter/foundation.dart';

import '../../domain/usecases/update_tarea_usecases.dart';

class UpdateTareaProvider extends ChangeNotifier {
  final UpdateTareaUseCase updateTareaUseCase;
  bool response = false;
  UpdateTareaProvider({required this.updateTareaUseCase});

  Future<void> updateTarea(String id, String status) async {
    response = await updateTareaUseCase.execute(id, status);
    if (response) {
      notifyListeners();
    } else {
      print('algo falla');
    }
  }
}
