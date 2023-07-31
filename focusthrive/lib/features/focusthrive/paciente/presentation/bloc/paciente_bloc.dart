import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';

// import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';
import 'package:focusthrive/features/focusthrive/tarea/domain/entities/tarea.dart';

import '../../domain/usecases/cerrar_sesion.dart';
// import '../../domain/usecases/paciente/create_profile_usecases.dart';
import '../../../tarea/domain/usecases/create_tarea_usecases.dart';
import '../../domain/usecases/get_paciente_usecases.dart';
import '../../domain/usecases/login_paciente.dart';
import '../../../tarea/domain/usecases/get_tarea_usecases.dart';
part 'paciente_event.dart';
part 'paciente_state.dart';

class PacienteBloc extends Bloc<PacienteEvent, PacienteState> {
  final CreateTareaUseCase createTareaUseCase;
  final GetPacienteUseCase getPacienteUseCase;
  // final CreateProfileUseCase createProfileUseCase;
  final LoginPacienteUseCase loginPacienteUseCase;
  final CerrarSesionUseCase cerrarSesionUseCase;
  final GetTareaUseCase getTareaUseCase;

  PacienteBloc({
    required this.createTareaUseCase,
    required this.getPacienteUseCase,
    // required this.createProfileUseCase,
    required this.loginPacienteUseCase,
    required this.cerrarSesionUseCase,
    required this.getTareaUseCase,
  }) : super(LoadedPage()) {
    on<PacienteEvent>((event, emit) async {
      if (event is Presslogin) {
        try {
          emit(Loading());
          bool response =
              await loginPacienteUseCase.execute(event.correo, event.password);
          if (response == true) {
            emit(PacienteVerificado(token: true));
            await Future.delayed(const Duration(milliseconds: 25000), () {
              emit(LoadedPage());
            });
          } else {
            emit(PacienteVerificado(token: false));
          }
        } catch (e) {
          emit(ErrorLoginPaciente(message: e.toString()));
        }
        // } else if (event is SignedHome){
      } else if (event is CreatePaciente) {
        try {
          emit(Loading());
          print('crear usuario');
          // bool response = await createProfileUseCase.execute(
          //     event.nombre,
          //     event.apellido,
          //     event.urlfoto,
          //     event.correo,
          //     event.telefono,
          //     event.password,
          //     event.plan,
          //     event.tarjeta);
          // print(response);
          // if (response == true) {
          //   emit(PacienteCreado(created: response));
          // } else {
          //   emit(Error(error: "Ocurrio un error creando la cuenta"));
          //   await Future.delayed(const Duration(milliseconds: 2500), () {
          //     emit(LoadedPage());
          //   });
          // }
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is GetPaciente) {
        try {
          final Paciente? paciente = await getPacienteUseCase.execute(event.id);
          if (paciente != null) {
            emit(LoadedPaciente(paciente: paciente));
          }
          emit(LoadedPage());
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
      } else if (event is PressTarea) {
        print("obtener tarea");
        try {
          List<Tarea> tarea = await getTareaUseCase.execute(event.id);
          print(tarea[0].titulo);
          emit(LoadedTareas(tareas: tarea));
        } catch (e) {
          emit(Error(error: 'Ocurrio un error obtebiendo la tarea'));
        }
      }

      // else if(event is SignedInHome)
      else if (event is Logout) {
        await cerrarSesionUseCase.execute();
      } else {
        emit(InitialState());
      }
    });
  }
}
