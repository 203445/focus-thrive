import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/home.dart';
import 'package:focusthrive/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/focusthrive/paciente/presentation/notification/notification_api.dart';
import 'features/focusthrive/paciente/presentation/pages/suscription.dart';
import 'features/focusthrive/psicologo/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await AndroidAlarmManager.initialize();
  await initNotifications();
  // await AlarmAn.init(showDebugLogs: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(11, 117, 133, 1)),
        // useMaterial3: true,
        textTheme: GoogleFonts.workSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => Home());
          case '/buscar':
            return MaterialPageRoute(builder: (_) => PremiumSubscriptionView());
          case '/perfil':
            return MaterialPageRoute(builder: (_) => HomePs());
          default:
            return null;
        }
      },
      // home: const LoginPaciente(),
      home: const OnboardingScreen(),
    );
  }
}
