import 'dart:io';
import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/repositories/psicologo_repository.dart';

class CreateProfilePsicologoUseCase {
  final PsicologoRepository psicologoRepository;

  CreateProfilePsicologoUseCase(this.psicologoRepository);

  Future<bool> execute(
    String nombre,
    String apellidos,
    String telefono,
    String contrasena,
    File? urlFoto,
    String descripcion,
    String ubicacion,
    String numerotarjeta,
    String correo,
    String rating,
  ) async {
    return await psicologoRepository.createProfile(
        nombre,
        apellidos,
        telefono,
        contrasena,
        urlFoto,
        descripcion,
        ubicacion,
        numerotarjeta,
        correo,
        rating);
  }
}
