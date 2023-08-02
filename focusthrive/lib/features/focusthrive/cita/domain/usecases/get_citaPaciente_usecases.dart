import 'package:focusthrive/features/focusthrive/cita/domain/entities/cita.dart';

import '../repositories/cita_repository.dart';

class GetCitaPacienteUseCase {
  final CitaRepository citaRepository;

  GetCitaPacienteUseCase(this.citaRepository);

  Future<List<Cita?>> execute(
    String id,
  ) async {
    return await citaRepository.getCitaPaciente(id);
  }
}
