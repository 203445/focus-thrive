import 'dart:io';

import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';

import '../../domain/repositories/paciente_repository.dart';
import '../datasources/paciente_remote.dart';

class PacienteRepositoryImp extends PacienteRepository {
  final PacienteRemoteDataSource pacienteRemoteDataSource;

  PacienteRepositoryImp({required this.pacienteRemoteDataSource});

  @override
  Future<bool> createProfile(
      String nombre,
      String apellidos,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta) async {
    return await pacienteRemoteDataSource.createProfile(nombre, apellidos,
        urlFoto, correo, telefono, contrasena, esPremium, numerotarjeta);
  }

  @override
  Future<Paciente?> getPaciente(String id) async {
    return await pacienteRemoteDataSource.getPaciente(id);
  }

  @override
  Future<bool> loginPaciente(String correo, String password) async {
    return await pacienteRemoteDataSource.loginPaciente(correo, password);
  }

  @override
  Future<void> cerrarSesion() async {
    return await pacienteRemoteDataSource.cerrarSesion();
  }

  @override
  Future<bool> updatePaciente(String id, String name, String apellido,
      String email, String telefono, String descripcion) async {
    return await pacienteRemoteDataSource.updatePaciente(
        id, name, apellido, email, telefono, descripcion);
  }

  @override
  Future<bool> undoPlanPaciente(String id) async {
    return await pacienteRemoteDataSource.undoPlanPaciente(id);
  }

  @override
  Future<bool> updatePlanPaciente(String id) async {
    return await pacienteRemoteDataSource.updatePlanPaciente(id);
  }
}
