import 'dart:io';

import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';

abstract class PacienteRepository {
  // Future<bool> verificationEmail(String email);
  Future<bool> createProfile(String nombre, String apellidos, File? urlFoto,
      String correo, String telefono, String contrasena, String numerotarjeta);

  Future<Paciente?> getPaciente(String id);
  Future<bool> loginPaciente(String correo, String password);
  Future<void> cerrarSesion();
  Future<bool> updatePaciente(
    String id,
    String name,
    String apellido,
    String email,
    String telefono,
    File? imagen,
  );
  Future<bool> updateData(
    String id,
    String name,
    String apellido,
    String email,
    String telefono,
    String imagen,
  );
  Future<bool> undoPlanPaciente(String id);
  Future<bool> updatePlanPaciente(String id);
  Future<bool> delete(String id);
}
