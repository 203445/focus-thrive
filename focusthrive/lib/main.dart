import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/bloc/paciente_bloc.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/home.dart';
import 'package:focusthrive/onboarding.dart';
import 'package:focusthrive/usecase_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/focusthrive/paciente/presentation/notification/notification_api.dart';
import 'features/focusthrive/paciente/presentation/pages/encuesta.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();
  await initNotifications();

  runApp(const MyApp());
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PacienteBloc>(
          create: (BuildContext context) => PacienteBloc(
              createTareaUseCase: usecaseConfig.createTareaUseCase!,
              getPacienteUseCase: usecaseConfig.getPacienteUseCase!,
              createProfileUseCase: usecaseConfig.createProfileUseCase!,
              loginPacienteUseCase: usecaseConfig.loginPacienteUseCase!,
              cerrarSesionUseCase: usecaseConfig.cerrarSesionUseCase!,
              getTareaUseCase: usecaseConfig.getTareaUseCase!),
        ),
      ],
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(11, 117, 133, 1)),
          // useMaterial3: true,
          textTheme: GoogleFonts.workSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        // home: const OnboardingScreen(),
        // home: OnboardingScreen(),
        // home: const Home(),
        home: SurveyView(),
        // home: MySample(),
      ),
    );
  }
}
