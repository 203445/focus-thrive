import 'dart:io';
import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/repositories/psicologo_repository.dart';

class CreateProfileUseCase {
  final PsicologoRepository psicologoRepository;

  CreateProfileUseCase(this.psicologoRepository);

  Future<Psicologo?> execute(
      String nombre,
      String apellidos,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta) async {
    return await psicologoRepository.createProfile(nombre, apellidos, urlFoto,
        correo, telefono, contrasena, esPremium, numerotarjeta);
  }
}
