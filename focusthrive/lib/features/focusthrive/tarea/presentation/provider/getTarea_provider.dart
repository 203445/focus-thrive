import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/tarea/domain/usecases/get_tarea_usecases.dart';

import '../../domain/entities/tarea.dart';

class GetTareaProvider extends ChangeNotifier {
  final GetTareaUseCase getTareaUseCase;

  GetTareaProvider({required this.getTareaUseCase});
  List<Tarea>? tarea;

  Future<void> getTarea(String id) async {
    tarea = await getTareaUseCase.execute(id);

    notifyListeners();
  }
}
