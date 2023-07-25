import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class GetPacienteUseCase {
  final PacienteRepository pacienteRepository;

  GetPacienteUseCase(this.pacienteRepository);

  Future<Paciente?> execute(
    String id,
  ) async {
    return await pacienteRepository.getPaciente(id);
  }
}
