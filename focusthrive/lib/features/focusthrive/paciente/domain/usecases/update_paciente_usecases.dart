import 'dart:io';

import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class UpdatePacienteUseCase {
  final PacienteRepository pacienteRepository;

  UpdatePacienteUseCase(this.pacienteRepository);

  Future<bool> execute(
    String id,
    String name,
    String apellido,
    String email,
    String telefono,
    File? imagen,
  ) async {
    return await pacienteRepository.updatePaciente(
        id, name, apellido, email, telefono, imagen);
  }
}
