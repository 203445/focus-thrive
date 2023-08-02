import 'package:flutter/foundation.dart';
import '../../domain/usecases/update_data_usecases.dart';

class UpdatePacienteDataProvider extends ChangeNotifier {
  final UpdatePacienteDataUseCase updatePsicologoUseCase;
  UpdatePacienteDataProvider({required this.updatePsicologoUseCase});
  bool response = false;

  Future<void> updatePacienteData(String id, String name, String apellido,
      String email, String telefono, String imagen) async {
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
