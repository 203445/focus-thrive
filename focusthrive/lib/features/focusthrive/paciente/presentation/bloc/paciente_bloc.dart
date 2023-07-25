import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';

// import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/tarea.dart';

import '../../domain/usecases/cerrar_sesion.dart';
import '../../domain/usecases/create_profile_usecases.dart';
import '../../domain/usecases/create_tarea_usecases.dart';
import '../../domain/usecases/get_paciente_usecases.dart';
import '../../domain/usecases/login_paciente.dart';
part 'paciente_event.dart';
part 'paciente_state.dart';

class PacienteBloc extends Bloc<PacienteEvent, PacienteState> {
  final CreateTareaUseCase createTareaUseCase;
  final GetPacienteUseCase getPacienteUseCase;
  final CreateProfileUseCase createProfileUseCase;
  final LoginPacienteUseCase loginPacienteUseCase;
  final CerrarSesionUseCase cerrarSesionUseCase;

  PacienteBloc({
    required this.createTareaUseCase,
    required this.getPacienteUseCase,
    required this.createProfileUseCase,
    required this.loginPacienteUseCase,
    required this.cerrarSesionUseCase,
  }) : super(LoadedPage()) {
    on<PacienteEvent>((event, emit) async {
      if (event is CreatePaciente) {
        try {
          emit(Loading());
          print('crear usuario');
          bool response = await createProfileUseCase.execute(
              event.nombre,
              event.apellido,
              event.urlfoto,
              event.correo,
              event.telefono,
              event.password,
              event.plan,
              event.tarjeta);
          if (response == false) {
            emit(Error(error: "Actualmente este correo está en uso"));
            await Future.delayed(const Duration(milliseconds: 2500), () {
              emit(LoadedPage());
            });
          }
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is GetPaciente) {
        try {
          final Paciente? paciente = await getPacienteUseCase.execute(event.id);
          if (paciente != null) {
            emit(LoadedPaciente(paciente: paciente));
          }
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is CreateTarea) {
        print("evento es createtarea");
        try {
          emit(Loading());
          print('dos aqui');
          Tarea? tarea = await createTareaUseCase.execute(
              event.titulo,
              event.description,
              event.fechaInicio,
              event.fechaFinal,
              event.userId,
              event.status);

          if (tarea != null) {
            print("tarea creada");
            emit(TareaCreated(tarea: tarea));
          } else {
            emit(Error(error: 'Ocurrio un error creando la tarea'));
            await Future.delayed(const Duration(milliseconds: 2500), () {
              emit(LoadedPage());
              emit(LoadedTareas(tareas: []));
            });
          }
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is Presslogin) {
        try {
          emit(VerificandoPaciente());
          bool response =
              await loginPacienteUseCase.execute(event.correo, event.password);
          if (response) {
            emit(PacienteVerificado(token: true));
          } else {
            emit(PacienteVerificado(token: false));
            emit(LoginSuccess());
          }
        } catch (e) {
          emit(ErrorLoginPaciente(message: e.toString()));
        }
      } else if (event is Logout) {
        await cerrarSesionUseCase.execute();
      }
    });
  }
}
