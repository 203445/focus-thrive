import 'dart:io';

import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';

abstract class PacienteRepository {
  // Future<bool> verificationEmail(String email);
  Future<bool> createProfile(
      String nombre,
      String apellidos,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta);

  Future<Paciente?> getPaciente(String id);
  Future<bool> loginPaciente(String correo, String password);
  Future<void> cerrarSesion();
}
