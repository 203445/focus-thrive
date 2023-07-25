import 'package:focusthrive/features/focusthrive/paciente/data/datasources/paciente_remote.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/usecases/create_tarea_usecases.dart';

import 'features/focusthrive/paciente/data/datasources/tarea_remote.dart';
import 'features/focusthrive/paciente/data/repositories/paciente_respository_imp.dart';
import 'features/focusthrive/paciente/data/repositories/tarea_repository_imp.dart';
import 'features/focusthrive/paciente/domain/usecases/cerrar_sesion.dart';
import 'features/focusthrive/paciente/domain/usecases/create_profile_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/get_paciente_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/get_tarea_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/login_paciente.dart';

class UsecaseConfig {
  // --------TAREAS----------
  CreateTareaUseCase? createTareaUseCase;
  GetTareaUseCase? getTareaUseCase;

  TareaRepositoryImp? tareaRepositoryImp;
  TareaRemoteDataSourceImp? tareaRemoteDataSourceImp;

  // ------------Paciente------------
  GetPacienteUseCase? getPacienteUseCase;
  CreateProfileUseCase? createProfileUseCase;
  LoginPacienteUseCase? loginPacienteUseCase;

  PacienteRepositoryImp? pacienteRepositoryImp;
  PacienteRemoteDataSourceImp? pacienteRemoteDataSourceImp;
  CerrarSesionUseCase? cerrarSesionUseCase;

  UsecaseConfig() {
    tareaRemoteDataSourceImp = TareaRemoteDataSourceImp();
    tareaRepositoryImp =
        TareaRepositoryImp(tareaRemoteDataSource: tareaRemoteDataSourceImp!);
    createTareaUseCase = CreateTareaUseCase(tareaRepositoryImp!);
    getTareaUseCase = GetTareaUseCase(tareaRepositoryImp!);

    pacienteRemoteDataSourceImp = PacienteRemoteDataSourceImp();
    pacienteRepositoryImp = PacienteRepositoryImp(
        pacienteRemoteDataSource: pacienteRemoteDataSourceImp!);
    getPacienteUseCase = GetPacienteUseCase(pacienteRepositoryImp!);
    createProfileUseCase = CreateProfileUseCase(pacienteRepositoryImp!);
    loginPacienteUseCase = LoginPacienteUseCase(pacienteRepositoryImp!);
    cerrarSesionUseCase = CerrarSesionUseCase(pacienteRepositoryImp!);
  }
}
