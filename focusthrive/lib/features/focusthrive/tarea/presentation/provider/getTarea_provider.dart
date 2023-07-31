import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/tarea/domain/usecases/get_tarea_usecases.dart';

import '../../domain/entities/tarea.dart';

class GetTareaProvider extends ChangeNotifier {
  final GetTareaUseCase getTareaUseCase;

  GetTareaProvider({required this.getTareaUseCase});
  List<Tarea>? tarea;
  List<Tarea>? tareas = [];
  List<Tarea>? tareasCompletadas = [];
  Future<void> getTarea(String id) async {
    tarea = await getTareaUseCase.execute(id);
    for (var tarea in tarea!) {
      if (tarea.status == "terminada") {
        tareasCompletadas?.add(tarea);
      } else {
        tareas?.add(tarea);
      }
    }

    notifyListeners();
  }
}
