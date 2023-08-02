import 'package:focusthrive/features/focusthrive/consejo/data/datasources/consejo_remote.dart';
import 'package:focusthrive/features/focusthrive/encuesta/data/datasources/respuesta_remote.dart';
import 'package:focusthrive/features/focusthrive/paciente/data/datasources/paciente_remote.dart';
import 'package:focusthrive/features/focusthrive/consejo/data/repositories/consejo_repository_imp.dart';
import 'package:focusthrive/features/focusthrive/consejo/domain/usecases/get_consejo_usecases.dart';
import 'package:focusthrive/features/focusthrive/tarea/domain/usecases/create_tarea_usecases.dart';
import 'package:focusthrive/features/focusthrive/cita/domain/usecases/create_cita_usecases.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/usecases/psicologo/create_profile_usecases.dart';
import 'package:focusthrive/features/focusthrive/solicitud/domain/usecases/create_solicitud_usecases.dart';
import 'package:focusthrive/features/focusthrive/tarea/domain/usecases/update_tarea_usecases.dart';

import 'features/focusthrive/cita/domain/usecases/get_citaPaciente_usecases.dart';
import 'features/focusthrive/cita/domain/usecases/update_cita_usecases.dart';
import 'features/focusthrive/comentario/data/datasources/comentario_remote.dart';
import 'features/focusthrive/comentario/domain/usecases/list_comentario_usecases.dart';
import 'features/focusthrive/encuesta/data/repositories/respuesta_repository_imp.dart';
import 'features/focusthrive/encuesta/domain/usecases/get_respuesta_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/create_profile_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/delete_cuenta_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/udpatePlan_paciente_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/undoPlan_paciente_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/update_data_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/update_paciente_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/delete_psicologo_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/updateImage_profile_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/update_psicologo_usecases.dart';
import 'features/focusthrive/solicitud/domain/usecases/list_solicitud_usecases.dart';
import 'features/focusthrive/tarea/data/datasources/tarea_remote.dart';
import 'features/focusthrive/comentario/data/repositories/comentario_repository_imp.dart';
import 'features/focusthrive/paciente/data/repositories/paciente_respository_imp.dart';
import 'features/focusthrive/tarea/data/repositories/tarea_repository_imp.dart';
import 'features/focusthrive/comentario/domain/usecases/create_comentario_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/cerrar_sesion.dart';

import 'features/focusthrive/paciente/domain/usecases/get_paciente_usecases.dart';
import 'features/focusthrive/tarea/domain/usecases/delete_tarea_usecases.dart';
import 'features/focusthrive/tarea/domain/usecases/get_tarea_usecases.dart';
import 'features/focusthrive/paciente/domain/usecases/login_paciente.dart';
import 'features/focusthrive/cita/data/datasources/cita_remote.dart';
import 'features/focusthrive/psicologo/data/datasources/psicologo_remote.dart';
import 'features/focusthrive/solicitud/data/datasources/solicitud_remote.dart';
import 'features/focusthrive/cita/data/repositories/cita_repository_imp.dart';
import 'features/focusthrive/psicologo/data/repositories/psicologo_repository_imp.dart';
import 'features/focusthrive/solicitud/data/repositories/solicitud_repository_imp.dart';
import 'features/focusthrive/cita/domain/usecases/delete_cita_usecases.dart';
import 'features/focusthrive/cita/domain/usecases/get_cita_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/getAll_psicologo_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/get_psicologo_usecases.dart';
import 'features/focusthrive/psicologo/domain/usecases/psicologo/login_psicologo_usecases.dart';

class UsecaseConfig {
  // --------TAREAS----------
  CreateTareaUseCase? createTareaUseCase;
  GetTareaUseCase? getTareaUseCase;
  DeleteTareaUseCase? deleteTareaUseCase;
  UpdateTareaUseCase? updateTareaUseCase;

  TareaRepositoryImp? tareaRepositoryImp;
  TareaRemoteDataSourceImp? tareaRemoteDataSourceImp;

  // ------------Paciente------------
  GetPacienteUseCase? getPacienteUseCase;
  CreateProfileUseCase? createProfileUseCase;
  LoginPacienteUseCase? loginPacienteUseCase;
  CerrarSesionUseCase? cerrarSesionUseCase;
  UpdatePacienteUseCase? updatePacienteUseCase;
  UndoPlanPacienteUseCase? undoPlanPacienteUseCase;
  UpdatePlanPacienteUseCase? updatePlanPacienteUseCase;
  UpdatePacienteDataUseCase? updatePacienteDataUseCase;
  DeletePacienteUseCase? deletePacienteUseCase;

  PacienteRepositoryImp? pacienteRepositoryImp;
  PacienteRemoteDataSourceImp? pacienteRemoteDataSourceImp;

  // ---------------Solicitudes---------------------
  CreateSolicitudUseCase? createSolicitudUseCase;
  ListSolicitudUseCase? listSolicitudUseCase;

  SolicitudRepositoryImp? solicitudRepositoryImp;
  SolicitudRemoteDataSourceImp? solicitudRemoteDataSourceImp;

  // ---------------------Citas----------------------
  CreateCitaUseCase? createCitaUseCase;
  GetCitaUseCase? getCitaUseCase;
  DeleteCitaUseCase? deleteCitaUseCase;
  UpdateCitaUseCase? updateCitaUseCase;
  GetCitaPacienteUseCase? getCitaPacienteUseCase;

  CitaRepositoryImp? citaRepositoryImp;
  CitaRemoteDataSourceImp? citaRemoteDataSourceImp;

  // ---------------------Psicologo----------------------
  CreateProfilePsicologoUseCase? createProfilePsicologoUseCase;
  LoginPsicologoUseCase? loginPsicologoUseCase;
  GetPsicologoUseCase? getPsicologoUseCase;

  PsicologoRepositoryImp? psicologoRepositoryImp;
  PsicologoRemoteDataSourceImp? psicologoRemoteDataSourceImp;
  GetAllPsicologoUseCase? getAllPsicologosUseCase;
  UpdatePsicologoUseCase? updatePsicologoUseCase;
  UpdatePsicologoProfileUseCase? updatePsicologoProfileUseCase;
  DeletePsicologoUseCase? deletePsicologoUseCase;

  // -----------------Consejo------------------------------
  GetConsejoUseCase? getConsejoUseCase;

  ConsejoRepositoryImp? consejoRepositoryImp;
  ConsejoRemoteDataSourceImp? consejoRemoteDataSourceImp;

  // -------------------Comentarios-----------------------------
  CreateComentarioUseCase? createComenterioUseCase;
  ListComentarioUseCase? listComentarioUseCase;

  ComentarioRepositoryImp? comentarioRepositoryImp;
  ComentarioRemoteDataSourceImp? comentarioRemoteDataSourceImp;

  // --------------------Respuesta----------------------------
  GetRespuestaUseCase? getRespuestaUseCase;
  RespuestaRepositoryImp? respuestaRepositoryImp;
  RespuestaRemoteDataSourceImp? respuestaRemoteDataSourceImp;

  UsecaseConfig() {
    // -------------------TAREA-------------------------------
    tareaRemoteDataSourceImp = TareaRemoteDataSourceImp();
    tareaRepositoryImp =
        TareaRepositoryImp(tareaRemoteDataSource: tareaRemoteDataSourceImp!);

    createTareaUseCase = CreateTareaUseCase(tareaRepositoryImp!);
    getTareaUseCase = GetTareaUseCase(tareaRepositoryImp!);
    deleteTareaUseCase = DeleteTareaUseCase(tareaRepositoryImp!);
    updateTareaUseCase = UpdateTareaUseCase(tareaRepositoryImp!);

    // ---------------------------SOLICITUD-----------------------
    solicitudRemoteDataSourceImp = SolicitudRemoteDataSourceImp();
    solicitudRepositoryImp = SolicitudRepositoryImp(
        solicitudRemoteDataSource: solicitudRemoteDataSourceImp!);

    createSolicitudUseCase = CreateSolicitudUseCase(solicitudRepositoryImp!);
    listSolicitudUseCase = ListSolicitudUseCase(solicitudRepositoryImp!);

    // -----------------------CITA-------------------------------------
    citaRemoteDataSourceImp = CitaRemoteDataSourceImp();
    citaRepositoryImp =
        CitaRepositoryImp(citaRemoteDataSource: citaRemoteDataSourceImp!);

    createCitaUseCase = CreateCitaUseCase(citaRepositoryImp!);
    getCitaUseCase = GetCitaUseCase(citaRepositoryImp!);
    deleteCitaUseCase = DeleteCitaUseCase(citaRepositoryImp!);
    updateCitaUseCase = UpdateCitaUseCase(citaRepositoryImp!);
    getCitaPacienteUseCase = GetCitaPacienteUseCase(citaRepositoryImp!);

    // ---------------------PSICOLOGO----------------------------------
    psicologoRemoteDataSourceImp = PsicologoRemoteDataSourceImp();
    psicologoRepositoryImp = PsicologoRepositoryImp(
        psicologoRemoteDataSource: psicologoRemoteDataSourceImp!);

    createProfilePsicologoUseCase =
        CreateProfilePsicologoUseCase(psicologoRepositoryImp!);
    loginPsicologoUseCase = LoginPsicologoUseCase(psicologoRepositoryImp!);
    getPsicologoUseCase = GetPsicologoUseCase(psicologoRepositoryImp!);
    getAllPsicologosUseCase = GetAllPsicologoUseCase(psicologoRepositoryImp!);
    updatePsicologoUseCase = UpdatePsicologoUseCase(psicologoRepositoryImp!);
    updatePsicologoProfileUseCase =
        UpdatePsicologoProfileUseCase(psicologoRepositoryImp!);
    deletePsicologoUseCase = DeletePsicologoUseCase(psicologoRepositoryImp!);
    // --------------------CONSEJO-------------------------------------
    consejoRemoteDataSourceImp = ConsejoRemoteDataSourceImp();
    consejoRepositoryImp = ConsejoRepositoryImp(
        consejoRemoteDataSource: consejoRemoteDataSourceImp!);

    getConsejoUseCase = GetConsejoUseCase(consejoRepositoryImp!);

    // ---------------------PACIENTE-----------------------------------
    pacienteRemoteDataSourceImp = PacienteRemoteDataSourceImp();
    pacienteRepositoryImp = PacienteRepositoryImp(
        pacienteRemoteDataSource: pacienteRemoteDataSourceImp!);
    getPacienteUseCase = GetPacienteUseCase(pacienteRepositoryImp!);
    createProfileUseCase = CreateProfileUseCase(pacienteRepositoryImp!);
    loginPacienteUseCase = LoginPacienteUseCase(pacienteRepositoryImp!);
    cerrarSesionUseCase = CerrarSesionUseCase(pacienteRepositoryImp!);
    updatePacienteUseCase = UpdatePacienteUseCase(pacienteRepositoryImp!);
    undoPlanPacienteUseCase = UndoPlanPacienteUseCase(pacienteRepositoryImp!);
    updatePlanPacienteUseCase =
        UpdatePlanPacienteUseCase(pacienteRepositoryImp!);
    deletePacienteUseCase = DeletePacienteUseCase(pacienteRepositoryImp!);

    // -------------------COMENTARIOS---------------------------------
    comentarioRemoteDataSourceImp = ComentarioRemoteDataSourceImp();
    comentarioRepositoryImp = ComentarioRepositoryImp(
        comentarioRemoteDataSource: comentarioRemoteDataSourceImp!);

    createComenterioUseCase = CreateComentarioUseCase(comentarioRepositoryImp!);
    listComentarioUseCase = ListComentarioUseCase(comentarioRepositoryImp!);

    // ----------------------RESPUESTA----------------------------------
    respuestaRemoteDataSourceImp = RespuestaRemoteDataSourceImp();
    respuestaRepositoryImp = RespuestaRepositoryImp(
        respuestaRemoteDataSource: respuestaRemoteDataSourceImp!);
    getRespuestaUseCase = GetRespuestaUseCase(respuestaRepositoryImp!);
  }
}
