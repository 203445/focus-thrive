import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/cuentaP.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/login.dart';
import 'package:focusthrive/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/paciente_bloc.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(11, 117, 133, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            leading: IconButton(
              icon: const Icon(
                Icons.navigate_before_rounded,
                size: 43,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Perfil",
              style: GoogleFonts.getFont(
                'Work Sans',
                textStyle: const TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 110,
                  backgroundImage: AssetImage('assets/img/image.jpeg'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    top: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(211, 237, 234, 0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: 245,
                      height: 70,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Josh Mellark",
                          style: GoogleFonts.getFont('Work Sans',
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  color: Color.fromRGBO(77, 95, 111, 1),
                                  fontWeight: FontWeight.w400)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 245,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: const Color.fromRGBO(20, 148, 164, 1),
                          width: 1.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CuentaP()),
                        );
                      },
                      child: Text(
                        "Cuenta",
                        style: GoogleFonts.getFont(
                          'Work Sans',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(77, 95, 111, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 245,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: const Color.fromRGBO(20, 148, 164, 1),
                          width: 1.0,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Configuración",
                        style: GoogleFonts.getFont(
                          'Work Sans',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(77, 95, 111, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 245,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: const Color.fromRGBO(20, 148, 164, 1),
                          width: 1.0,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Ayuda",
                        style: GoogleFonts.getFont(
                          'Work Sans',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(77, 95, 111, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 245,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: const Color.fromRGBO(20, 148, 164, 1),
                          width: 1.0,
                        ),
                      ),
                      onPressed: () async {
                        context.read<PacienteBloc>().add(Logout());

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnboardingScreen()),
                          );
                        });
                      },
                      child: Text(
                        "Cerrar Sesión",
                        style: GoogleFonts.getFont(
                          'Work Sans',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(77, 95, 111, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
