import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class CerrarSesionUseCase {
  final PacienteRepository pacienteRepository;

  CerrarSesionUseCase(this.pacienteRepository);

  Future<void> execute() async {
    return await pacienteRepository.cerrarSesion();
  }
}
