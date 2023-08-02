import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/cita/domain/entities/cita.dart';

import '../../domain/usecases/get_citaPaciente_usecases.dart';

class GetCitaPacienteProvider extends ChangeNotifier {
  final GetCitaPacienteUseCase listCitaUseCase;

  GetCitaPacienteProvider({required this.listCitaUseCase});
  List<Cita>? cita;

  Future<void> listCitaPaciente(
    String idPaciente,
  ) async {
    cita = (await listCitaUseCase.execute(idPaciente)).cast<Cita>();
    if (cita != []) {
      notifyListeners();
    } else {
      print('Aún no tienes citas');
    }
  }
}
