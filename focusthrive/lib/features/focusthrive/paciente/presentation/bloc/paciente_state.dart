part of 'paciente_bloc.dart';

abstract class PacienteState {}

class InitialState extends PacienteState {}

class Loading extends PacienteState {}

class LoadedPage extends PacienteState {}

class TareaCreated extends PacienteState {
  final Tarea tarea;
  TareaCreated({required this.tarea});
}

class LoadedPaciente extends PacienteState {
  final Paciente paciente;
  LoadedPaciente({required this.paciente});
}

class LoadedTareas extends PacienteState {
  final List<Tarea> tareas;
  LoadedTareas({required this.tareas});
}

class Error extends PacienteState {
  final String error;
  Error({required this.error});
}

// login
class VerificandoPaciente extends PacienteState {}

class PacienteVerificado extends PacienteState {
  final bool token;
  PacienteVerificado({required this.token});
}

class LoginSuccess extends PacienteState {}

class ErrorLoginPaciente extends PacienteState {
  final String message;

  ErrorLoginPaciente({required this.message});

  @override
  List<Object?> get props => [message];
}

class PacienteCreado extends PacienteState {
  final bool created;

  PacienteCreado({required this.created});
}
