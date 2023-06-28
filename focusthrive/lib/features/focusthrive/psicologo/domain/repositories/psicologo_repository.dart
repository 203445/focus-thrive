import 'dart:io';
import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';

abstract class PsicologoRepository {
  Future<Psicologo?> createProfile(
      String nombre,
      String apellidos,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta);
}
