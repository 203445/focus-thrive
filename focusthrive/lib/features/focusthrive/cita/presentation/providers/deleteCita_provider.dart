import 'package:flutter/foundation.dart';

import '../../domain/usecases/delete_cita_usecases.dart';

class DeleteCitaProvider extends ChangeNotifier {
  final DeleteCitaUseCase deleteCitaUseCase;

  DeleteCitaProvider({required this.deleteCitaUseCase});
  bool cita = false;

  Future<void> deleteCita(
    String id,
  ) async {
    cita = await deleteCitaUseCase.execute(id);
    if (cita == true) {
      notifyListeners();
    } else {
      print('No se puede eliminar la cita');
    }
  }
}
