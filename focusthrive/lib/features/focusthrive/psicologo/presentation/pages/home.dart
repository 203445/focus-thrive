import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/cita/presentation/cita.dart';
import 'package:focusthrive/features/focusthrive/comentario/presentation/pages/comentario_vista.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/pages/perfil.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/pages/solicitudes.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../paciente/presentation/pages/ayuda.dart';

class HomePs extends StatefulWidget {
  const HomePs({super.key});

  @override
  State<HomePs> createState() => _HomeState();
}

class _HomeState extends State<HomePs> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 6, // Ajusta el valor de elevación según tus preferencias
            child: Container(
              width: screenWidth,
              color: const Color.fromRGBO(11, 117, 133, 0.72),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/img/ok.jpg'),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Hola Francisco',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Para ti',
              style: GoogleFonts.getFont('Work Sans',
                  textStyle: const TextStyle(
                      fontSize: 33,
                      color: Color.fromRGBO(102, 109, 149, 1),
                      fontWeight: FontWeight.w400)),
              textAlign: TextAlign.center,
            ),
          ),
          // Parte inferior: Contenido y barra de navegación
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Contenido
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Solicitudes()));
                            },
                            child: Container(
                              width: 300,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(20, 148, 164, 1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Solicitudes',
                                  style: GoogleFonts.getFont('Work Sans',
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          color:
                                              Color.fromRGBO(102, 109, 149, 1),
                                          fontWeight: FontWeight.w600)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CitasListView()));
                            },
                            child: Container(
                              width: 300,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(20, 148, 164, 1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Citas',
                                  style: GoogleFonts.getFont('Work Sans',
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          color:
                                              Color.fromRGBO(102, 109, 149, 1),
                                          fontWeight: FontWeight.w600)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ComentariosListView()));
                            },
                            child: Container(
                              width: 300,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(20, 148, 164, 1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Comentarios',
                                  style: GoogleFonts.getFont('Work Sans',
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          color:
                                              Color.fromRGBO(102, 109, 149, 1),
                                          fontWeight: FontWeight.w600)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Barra de navegación
                  Container(
                    height: 65,
                    color: Color.fromRGBO(11, 117, 133, 0.72),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                // Acción al presionar el ícono de inicio
                              },
                            ),
                            Text(
                              'Inicio',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PerfilP()));
                              },
                            ),
                            Text(
                              'Perfil',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AyudaP()));
                              },
                            ),
                            Text(
                              'Ajustes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  Navigator.push(context,
//                             MaterialPageRoute(builder: (context) =>  PremiumSubscriptionView()));