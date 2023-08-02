import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/provider/auth_provider.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/provider/createPaciente_provider.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/provider/getAuth_provider.dart';
import 'package:focusthrive/features/focusthrive/tarea/presentation/provider/addTarea_provider.dart';
import 'package:focusthrive/features/focusthrive/tarea/presentation/provider/deleteTarea_provider.dart';
import 'package:focusthrive/features/focusthrive/tarea/presentation/provider/getTarea_provider.dart';
import 'package:focusthrive/features/focusthrive/tarea/presentation/provider/updateTarea_provider.dart';
import 'package:focusthrive/onboarding.dart';
import 'package:focusthrive/usecase_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'features/focusthrive/cita/presentation/providers/createCitas_provider.dart';
import 'features/focusthrive/cita/presentation/providers/deleteCita_provider.dart';
import 'features/focusthrive/cita/presentation/providers/getCitaPaciente_provider.dart';
import 'features/focusthrive/cita/presentation/providers/listCita_provider.dart';
import 'features/focusthrive/cita/presentation/providers/updateCita_provider.dart';
import 'features/focusthrive/comentario/presentation/pages/providers/create_comentario_provider.dart';
import 'features/focusthrive/comentario/presentation/pages/providers/get_comentario_provider.dart';
import 'features/focusthrive/consejo/presentation/providers/get_consejos_providers.dart';
import 'features/focusthrive/encuesta/presentation/providers/get_respuestas_provider.dart';
import 'features/focusthrive/paciente/presentation/notification/notification_api.dart';
import 'features/focusthrive/paciente/presentation/pages/encuesta.dart';
import 'features/focusthrive/paciente/presentation/provider/deleteAccountPaciente_provider.dart';
import 'features/focusthrive/paciente/presentation/provider/updateData_provider.dart';
import 'features/focusthrive/paciente/presentation/provider/updatePaciente_provider.dart';
import 'features/focusthrive/psicologo/presentation/providers/authPsicologo_provider.dart';
import 'features/focusthrive/psicologo/presentation/providers/createPsicologo_provider.dart';
import 'features/focusthrive/psicologo/presentation/providers/deleteAccount_provider.dart';
import 'features/focusthrive/psicologo/presentation/providers/getAllPsicologo_provider.dart';
import 'features/focusthrive/psicologo/presentation/providers/getPsicologo_provider.dart';
import 'features/focusthrive/psicologo/presentation/providers/updateData_provider.dart';
import 'features/focusthrive/psicologo/presentation/providers/updatePsicologo-provider.dart';
import 'features/focusthrive/solicitud/presentation/providers/crearSolicitud_provider.dart';
import 'features/focusthrive/solicitud/presentation/providers/listSolicitud_provider.dart';
// import 'features/focusthrive/paciente/presentation/pages/encuesta.dart';
// import 'features/focusthrive/paciente/presentation/pages/home2.dart';
// import 'features/focusthrive/psicologo/presentation/pages/home.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();
  await initNotifications();

  runApp(const MyApp());
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider(
                loginPacienteUseCase: usecaseConfig.loginPacienteUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetAuthProvider(
                getPacienteUseCase: usecaseConfig.getPacienteUseCase!)),
        ChangeNotifierProvider(
            create: (_) => AddTareaProvider(
                createTareaUseCase: usecaseConfig.createTareaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetTareaProvider(
                getTareaUseCase: usecaseConfig.getTareaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => UpdateTareaProvider(
                updateTareaUseCase: usecaseConfig.updateTareaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => DeleteTareaProvider(
                deleteTareaUseCase: usecaseConfig.deleteTareaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => CreatePacienteProvider(
                createProfileUseCase: usecaseConfig.createProfileUseCase!)),
        ChangeNotifierProvider(
            create: (_) => CreatePsicologoProvider(
                createProfilePsicologoUseCase:
                    usecaseConfig.createProfilePsicologoUseCase!)),
        ChangeNotifierProvider(
            create: (_) => AuthPsicologoProvider(
                loginPsicologoUseCase: usecaseConfig.loginPsicologoUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetPsicologoProvider(
                getPsicologoUseCase: usecaseConfig.getPsicologoUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetConsejoProvider(
                getConsejoUseCase: usecaseConfig.getConsejoUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetAllPsicologoProvider(
                getAllPsicologoUseCase:
                    usecaseConfig.getAllPsicologosUseCase!)),
        ChangeNotifierProvider(
            create: (_) => CreateComentarioProvider(
                createComentarioUseCase:
                    usecaseConfig.createComenterioUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetComentarioProvider(
                listComentarioUseCase: usecaseConfig.listComentarioUseCase!)),
        ChangeNotifierProvider(
            create: (_) => ListSolicitudProvider(
                listSolicitudUseCase: usecaseConfig.listSolicitudUseCase!)),
        ChangeNotifierProvider(
            create: (_) => CrearSolicitudProvider(
                createSolicitudUseCase: usecaseConfig.createSolicitudUseCase!)),
        ChangeNotifierProvider(
            create: (_) => CreateCitaProvider(
                createCitaUseCase: usecaseConfig.createCitaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetCitaProvider(
                listCitaUseCase: usecaseConfig.getCitaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => DeleteCitaProvider(
                deleteCitaUseCase: usecaseConfig.deleteCitaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => UpdatePacienteProvider(
                updatePsicologoUseCase: usecaseConfig.updatePacienteUseCase!)),
        ChangeNotifierProvider(
            create: (_) => UpdatePsicologoProvider(
                updateProfilePsicologoUseCase:
                    usecaseConfig.updatePsicologoUseCase!)),
        ChangeNotifierProvider(
            create: (_) => UpdateCitaProvider(
                updateCitaUseCase: usecaseConfig.updateCitaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetCitaPacienteProvider(
                listCitaUseCase: usecaseConfig.getCitaPacienteUseCase!)),
        ChangeNotifierProvider(
            create: (_) => UpdatePacienteDataProvider(
                updatePsicologoUseCase:
                    usecaseConfig.updatePacienteDataUseCase!)),
        ChangeNotifierProvider(
            create: (_) => UpdatePsicologoDataProvider(
                updateProfilePsicologoUseCase:
                    usecaseConfig.updatePsicologoProfileUseCase!)),
        ChangeNotifierProvider(
            create: (_) => GetRespuestaPacienteProvider(
                listRespuestaUseCase: usecaseConfig.getRespuestaUseCase!)),
        ChangeNotifierProvider(
            create: (_) => DeleteAccountPacienteProvider(
                deletePacienteAccountUseCase:
                    usecaseConfig.deletePacienteUseCase!)),
        ChangeNotifierProvider(
            create: (_) => DeleteAccountPsicologoProvider(
                deletePsicologoAccountUseCase:
                    usecaseConfig.deletePsicologoUseCase!)),
      ],
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(11, 117, 133, 1)),
          textTheme: GoogleFonts.workSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        // home: const OnboardingScreen(),
        home: const OnboardingScreen(),
        // home: const HomePs(),
        // home: SurveyView(),
        // home: Home(),
        // home: HomeP(),
        // home: MySample(),
      ),
    );
  }
}
