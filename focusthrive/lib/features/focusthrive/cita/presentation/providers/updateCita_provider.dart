import 'package:flutter/foundation.dart';

import '../../domain/usecases/update_cita_usecases.dart';

class UpdateCitaProvider extends ChangeNotifier {
  final UpdateCitaUseCase updateCitaUseCase;

  UpdateCitaProvider({required this.updateCitaUseCase});
  bool cita = false;

  Future<void> updateCita(String id, String status) async {
    cita = await updateCitaUseCase.execute(id, status);
    if (cita == true) {
      notifyListeners();
    } else {
      print('No se puede eliminar la cita');
    }
  }
}
