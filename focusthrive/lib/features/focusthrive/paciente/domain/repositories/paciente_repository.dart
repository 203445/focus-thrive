import 'dart:io';

import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';

abstract class PacienteRepository {
  Future<Paciente?> createProfile(
      String nombre,
      String apellidos,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta);
}
