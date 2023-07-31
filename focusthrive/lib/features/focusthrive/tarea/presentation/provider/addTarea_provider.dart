import 'package:flutter/foundation.dart';

import '../../domain/entities/tarea.dart';
import '../../domain/usecases/create_tarea_usecases.dart';

class AddTareaProvider extends ChangeNotifier {
  final CreateTareaUseCase createTareaUseCase;

  AddTareaProvider({required this.createTareaUseCase});
  Tarea? tarea;

  Future<void> createTarea(String titulo, String descripcion, String fechaI,
      String fechaF, String userId, String status) async {
    try {
      tarea = await createTareaUseCase.execute(
          titulo, descripcion, fechaI, fechaF, userId, status);

      if (tarea != null) {
        notifyListeners();
      } else {
        await Future.delayed(const Duration(milliseconds: 2500), () {
          notifyListeners();
        });
      }
    } catch (e) {
      print('Error de Login  $e');
    }
  }
}
