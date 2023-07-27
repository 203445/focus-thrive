import 'package:focusthrive/features/focusthrive/paciente/data/datasources/consejo_remote.dart';
import 'package:focusthrive/features/focusthrive/paciente/data/datasources/paciente_remote.dart';
import 'package:focusthrive/features/focusthrive/paciente/data/repositories/consejo_repository_imp.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/usecases/consejo/get_consejo_usecases.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/usecases/tarea/create_tarea_usecases.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/usecases/cita/create_cita_usecases.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/usecases/psicologo/create_profile_usecases.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/usecases/solicitud/create_solicitud_usecases.dart';

import 'features/focusthrive/paciente/data/datasources/comentario_remote.dart';
import 'features/focusthrive/paciente/data/datasources/tarea_remote.dart';
import 'features/focusthrive/paciente/data/repositories/comentario_repository_imp.dart';
import 'features/focusthrive/paciente/data/repositories/paciente_respository_imp.dart';
import 'features/focusthrive/paciente/data/repositories/tarea_repository_imp.dart';
import 'features/focusthrive/paciente/domain/usecases/comentario/create_comentario_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/paciente/cerrar_sesion.dart';
import 'features/focusthrive/paciente/domain/usecases/paciente/create_profile_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/paciente/get_paciente_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/tarea/delete_tarea_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/tarea/get_tarea_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/paciente/login_paciente.dart';
import 'features/focusthrive/psicologo/data/datasources/cita_remote.dart';
import 'features/focusthrive/psicologo/data/datasources/psicologo_remote.dart';
import 'features/focusthrive/psicologo/data/datasources/solicitud_remote.dart';
import 'features/focusthrive/psicologo/data/repositories/cita_repository_imp.dart';
import 'features/focusthrive/psicologo/data/repositories/psicologo_repository_imp.dart';
import 'features/focusthrive/psicologo/data/repositories/solicitud_repository_imp.dart';
import 'features/focusthrive/psicologo/domain/usecases/cita/delete_cita_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/cita/get_cita_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/getAll_psicologo_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/get_psicologo_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/login_psicologo_usecases.dart';

class UsecaseConfig {
  // --------TAREAS----------
  CreateTareaUseCase? createTareaUseCase;
  GetTareaUseCase? getTareaUseCase;
  DeleteTareaUseCase? deleteTareaUseCase;

  TareaRepositoryImp? tareaRepositoryImp;
  TareaRemoteDataSourceImp? tareaRemoteDataSourceImp;

  // ------------Paciente------------
  GetPacienteUseCase? getPacienteUseCase;
  CreateProfileUseCase? createProfileUseCase;
  LoginPacienteUseCase? loginPacienteUseCase;
  CerrarSesionUseCase? cerrarSesionUseCase;

  PacienteRepositoryImp? pacienteRepositoryImp;
  PacienteRemoteDataSourceImp? pacienteRemoteDataSourceImp;

  // ---------------Solicitudes---------------------
  CreateSolicitudUseCase? createSolicitudUseCase;

  SolicitudRepositoryImp? solicitudRepositoryImp;
  SolicitudRemoteDataSourceImp? solicitudRemoteDataSourceImp;

  // ---------------------Citas----------------------
  CreateCitaUseCase? createCitaUseCase;
  GetCitaUseCase? getCitaUseCase;
  DeleteCitaUseCase? deleteCitaUseCase;

  CitaRepositoryImp? citaRepositoryImp;
  CitaRemoteDataSourceImp? citaRemoteDataSourceImp;

  // ---------------------Psicologo----------------------
  CreateProfilePsicologoUseCase? createProfilePsicologoUseCase;
  LoginPsicologoUseCase? loginPsicologoUseCase;
  GetPsicologoUseCase? getPsicologoUseCase;

  PsicologoRepositoryImp? psicologoRepositoryImp;
  PsicologoRemoteDataSourceImp? psicologoRemoteDataSourceImp;
  GetAllPsicologoUseCase? getPsicologosUseCase;

  // -----------------Consejo------------------------------
  GetConsejoUseCase? getConsejoUseCase;

  ConsejoRepositoryImp? consejoRepositoryImp;
  ConsejoRemoteDataSourceImp? consejoRemoteDataSourceImp;

  // -------------------Comentarios-----------------------------
  CreateComentarioUseCase? createComenterioUseCase; //

  ComentarioRepositoryImp? comentarioRepositoryImp;
  ComentarioRemoteDataSourceImp? comentarioRemoteDataSourceImp;

  UsecaseConfig() {
    // -------------------TAREA-------------------------------
    tareaRemoteDataSourceImp = TareaRemoteDataSourceImp();
    tareaRepositoryImp =
        TareaRepositoryImp(tareaRemoteDataSource: tareaRemoteDataSourceImp!);

    createTareaUseCase = CreateTareaUseCase(tareaRepositoryImp!);
    getTareaUseCase = GetTareaUseCase(tareaRepositoryImp!);
    deleteTareaUseCase = DeleteTareaUseCase(tareaRepositoryImp!);

    // ---------------------------SOLICITUD-----------------------
    solicitudRemoteDataSourceImp = SolicitudRemoteDataSourceImp();
    solicitudRepositoryImp = SolicitudRepositoryImp(
        solicitudRemoteDataSource: solicitudRemoteDataSourceImp!);

    // -----------------------CITA-------------------------------------
    citaRemoteDataSourceImp = CitaRemoteDataSourceImp();
    citaRepositoryImp =
        CitaRepositoryImp(citaRemoteDataSource: citaRemoteDataSourceImp!);

    // ---------------------PSICOLOGO----------------------------------
    psicologoRemoteDataSourceImp = PsicologoRemoteDataSourceImp();
    psicologoRepositoryImp = PsicologoRepositoryImp(
        psicologoRemoteDataSource: psicologoRemoteDataSourceImp!);

    // --------------------CONSEJO-------------------------------------
    consejoRemoteDataSourceImp = ConsejoRemoteDataSourceImp();
    consejoRepositoryImp = ConsejoRepositoryImp(
        consejoRemoteDataSource: consejoRemoteDataSourceImp!);

    // ---------------------PACIENTE-----------------------------------
    pacienteRemoteDataSourceImp = PacienteRemoteDataSourceImp();
    pacienteRepositoryImp = PacienteRepositoryImp(
        pacienteRemoteDataSource: pacienteRemoteDataSourceImp!);
    getPacienteUseCase = GetPacienteUseCase(pacienteRepositoryImp!);
    createProfileUseCase = CreateProfileUseCase(pacienteRepositoryImp!);
    loginPacienteUseCase = LoginPacienteUseCase(pacienteRepositoryImp!);
    cerrarSesionUseCase = CerrarSesionUseCase(pacienteRepositoryImp!);

    createSolicitudUseCase = CreateSolicitudUseCase(solicitudRepositoryImp!);

    createCitaUseCase = CreateCitaUseCase(citaRepositoryImp!);
    getCitaUseCase = GetCitaUseCase(citaRepositoryImp!);
    deleteCitaUseCase = DeleteCitaUseCase(citaRepositoryImp!);

    // -----------------Psicologos-----------------------------
    createProfilePsicologoUseCase =
        CreateProfilePsicologoUseCase(psicologoRepositoryImp!);
    loginPsicologoUseCase = LoginPsicologoUseCase(psicologoRepositoryImp!);
    getPsicologoUseCase = GetPsicologoUseCase(psicologoRepositoryImp!);
    getPsicologosUseCase = GetAllPsicologoUseCase(psicologoRepositoryImp!);

    // ---------------------Consejos------------------------------
    getConsejoUseCase = GetConsejoUseCase(consejoRepositoryImp!);

    // -------------------COMENTARIOS---------------------------------
    comentarioRemoteDataSourceImp = ComentarioRemoteDataSourceImp();
    comentarioRepositoryImp = ComentarioRepositoryImp(
        comentarioRemoteDataSource: comentarioRemoteDataSourceImp!);
    createComenterioUseCase = CreateComentarioUseCase(comentarioRepositoryImp!);
  }
}
