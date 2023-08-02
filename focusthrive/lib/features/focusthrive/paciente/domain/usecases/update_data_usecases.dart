import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class UpdatePacienteDataUseCase {
  final PacienteRepository pacienteRepository;

  UpdatePacienteDataUseCase(this.pacienteRepository);

  Future<bool> execute(
    String id,
    String name,
    String apellido,
    String email,
    String telefono,
    String imagen,
  ) async {
    return await pacienteRepository.updateData(
        id, name, apellido, email, telefono, imagen);
  }
}
