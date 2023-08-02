import 'dart:io';

import '../entities/psicologo.dart';

abstract class PsicologoRepository {
  Future<bool> createProfile(
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
  );
  Future<bool> loginPsicologo(String correo, String password);
  Future<Psicologo?> getPsicologo();
  Future<List<Psicologo?>> getAllPsicologos();
  Future<bool> updatePsicologo(
      String id,
      String name,
      String apellido,
      String telefono,
      String correo,
      String descripcion,
      String ubicacion,
      File? urlfoto);
  Future<bool> updatePsicologoProfile(
      String id,
      String name,
      String apellido,
      String telefono,
      String correo,
      String descripcion,
      String ubicacion,
      String img);
  Future<bool> delete(String id);
}
