part of 'paciente_bloc.dart';

abstract class PacienteEvent {}

class GetPaciente extends PacienteEvent {
  final String id;
  GetPaciente({required this.id});
}

class CreatePaciente extends PacienteEvent {
  final String nombre;
  final String apellido;
  final File? urlfoto;
  final String correo;
  final String telefono;
  final String password;
  final String plan;
  final String tarjeta;

  CreatePaciente(
      {required this.nombre,
      required this.apellido,
      required this.urlfoto,
      required this.correo,
      required this.telefono,
      required this.password,
      required this.plan,
      required this.tarjeta});
}

class CreateTarea extends PacienteEvent {
  final String titulo;
  final String description;
  final String fechaInicio;
  final String fechaFinal;
  final String userId;
  final String status;

  CreateTarea(
      {required this.titulo,
      required this.description,
      required this.fechaInicio,
      required this.fechaFinal,
      required this.userId,
      required this.status});
}

class Presslogin extends PacienteEvent {
  final String correo;
  final String password;

  Presslogin({
    required this.correo,
    required this.password,
  });
}

class PressTarea extends PacienteEvent {
  final String id;

  PressTarea({
    required this.id,
  });
}

class Logout extends PacienteEvent {}
