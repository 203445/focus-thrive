import 'package:flutter/foundation.dart';

import '../../domain/usecases/get_respuesta_usecases.dart';

class GetRespuestaPacienteProvider extends ChangeNotifier {
  final GetRespuestaUseCase listRespuestaUseCase;

  GetRespuestaPacienteProvider({required this.listRespuestaUseCase});
  bool respuesta = false;

  Future<void> listRespuestaPaciente(
    String idPaciente,
  ) async {
    respuesta = await listRespuestaUseCase.execute(idPaciente);
    if (respuesta == true) {
      notifyListeners();
    } else {
      print('ya se le aplicó encuesta');
    }
  }
}
