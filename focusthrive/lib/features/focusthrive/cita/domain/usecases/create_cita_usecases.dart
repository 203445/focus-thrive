import 'package:focusthrive/features/focusthrive/cita/domain/entities/cita.dart';

import '../repositories/cita_repository.dart';

class CreateCitaUseCase {
  final CitaRepository citaRepository;

  CreateCitaUseCase(this.citaRepository);

  Future<Cita?> execute(
      String nombreD,
      String nombreP,
      String motivo,
      String status,
      String horario,
      String recomendaciones,
      String idDoctor,
      String idPaciente) async {
    return await citaRepository.createCita(nombreD, nombreP, motivo, status,
        horario, recomendaciones, idDoctor, idPaciente);
  }
}
