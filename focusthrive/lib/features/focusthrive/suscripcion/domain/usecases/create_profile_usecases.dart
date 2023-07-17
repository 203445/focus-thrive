import 'dart:io';
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class CreateProfileUseCase {
  final PacienteRepository pacienteRepository;

  CreateProfileUseCase(this.pacienteRepository);

  Future<Paciente?> execute(
      String nombre,
      String apellidos,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta) async {
    return await pacienteRepository.createProfile(nombre, apellidos, urlFoto,
        correo, telefono, contrasena, esPremium, numerotarjeta);
  }
}
