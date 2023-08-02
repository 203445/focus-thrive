import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/cita/domain/entities/cita.dart';

import '../../domain/usecases/get_cita_usecases.dart';

class GetCitaProvider extends ChangeNotifier {
  final GetCitaUseCase listCitaUseCase;

  GetCitaProvider({required this.listCitaUseCase});
  List<Cita>? cita;

  Future<void> listCita(
    String idDoc,
  ) async {
    cita = (await listCitaUseCase.execute(idDoc)).cast<Cita>();
    if (cita != []) {
      notifyListeners();
    } else {
      print('No se han registrado comentarios');
    }
  }
}
