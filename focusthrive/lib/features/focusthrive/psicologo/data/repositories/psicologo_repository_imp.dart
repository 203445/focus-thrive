import 'dart:io';

import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';

import '../../domain/repositories/psicologo_repository.dart';
import '../datasources/psicologo_remote.dart';

class PsicologoRepositoryImp extends PsicologoRepository {
  final PsicologoRemoteDataSource psicologoRemoteDataSource;

  PsicologoRepositoryImp({required this.psicologoRemoteDataSource});
  @override
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
  ) async {
    return await psicologoRemoteDataSource.createProfile(
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

  @override
  Future<bool> loginPsicologo(String correo, String password) async {
    return await psicologoRemoteDataSource.loginPsicologo(correo, password);
  }

  @override
  Future<Psicologo?> getPsicologo() async {
    return await psicologoRemoteDataSource.getPsicologo();
  }

  @override
  Future<List<Psicologo?>> getAllPsicologos() async {
    return await psicologoRemoteDataSource.getAllPsicologos();
  }

  @override
  Future<Psicologo?> updatePsicologo(String id, String name, String apellido,
      String telefono, String correo) async {
    return await psicologoRemoteDataSource.updatePsicologo(
        id, name, apellido, telefono, correo);
  }
}
