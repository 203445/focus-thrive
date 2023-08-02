import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/cita/domain/entities/cita.dart';
import '../../domain/usecases/create_cita_usecases.dart';

class CreateCitaProvider extends ChangeNotifier {
  final CreateCitaUseCase createCitaUseCase;

  CreateCitaProvider({required this.createCitaUseCase});
  Cita? cita;

  Future<void> createCita(
      String nombreD,
      String nombreP,
      String motivo,
      String status,
      String horario,
      String recomendaciones,
      String idD,
      String idP) async {
    cita = await createCitaUseCase.execute(
        nombreD, nombreP, motivo, status, horario, recomendaciones, idD, idP);
    if (cita != null) {
      notifyListeners();
    } else {
      print('No se puede hacer la cita ');
    }
  }
}
