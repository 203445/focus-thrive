import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/usecases/delete_cuenta_usecases.dart';

class DeleteAccountPacienteProvider extends ChangeNotifier {
  final DeletePacienteUseCase deletePacienteAccountUseCase;
  DeleteAccountPacienteProvider({required this.deletePacienteAccountUseCase});
  bool response = false;

  Future<void> deleteAccountPaciente(String id) async {
    response = await deletePacienteAccountUseCase.execute(id);
    if (response == true) {
      notifyListeners();
    } else {
      notifyListeners();
      print('No se puede actualizar');
    }
  }
}
