import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/usecases/update_paciente_usecases.dart';

class UpdatePacienteProvider extends ChangeNotifier {
  final UpdatePacienteUseCase updatePsicologoUseCase;
  UpdatePacienteProvider({required this.updatePsicologoUseCase});
  bool response = false;

  Future<void> updatePaciente(String id, String name, String apellido,
      String email, String telefono, File? imagen) async {
    response = await updatePsicologoUseCase.execute(
        id, name, apellido, email, telefono, imagen);
    if (response == true) {
      notifyListeners();
    } else {
      notifyListeners();
      print('No se puede actualizar');
    }
  }
}
