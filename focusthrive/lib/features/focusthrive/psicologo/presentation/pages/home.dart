import 'package:flutter/material.dart';

import 'package:focusthrive/features/focusthrive/cita/presentation/pages/cita.dart';
import 'package:focusthrive/features/focusthrive/comentario/presentation/pages/comentario_vista.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/pages/configuracionPsicologo.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/pages/perfil.dart';
import 'package:focusthrive/features/focusthrive/solicitud/presentation/pages/solicitudes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/getPsicologo_provider.dart';

class HomePs extends StatefulWidget {
  const HomePs({super.key});

  @override
  State<HomePs> createState() => _HomeState();
}

class _HomeState extends State<HomePs> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetPsicologoProvider>(context, listen: false).getPaciente();
    });
  }

  @override
  Widget build(BuildContext context) {
    final getPsicologo = Provider.of<GetPsicologoProvider>(context);
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
                      backgroundImage: Image.network(
                              'http://54.83.165.193${getPsicologo.psicologo?.urlFoto}')
                          .image,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hola ${getPsicologo.psicologo?.nombre} ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                                      builder: (context) => Solicitudes(
                                            psicologo: getPsicologo.psicologo!,
                                          )));
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
                                      builder: (context) => CitasListView(
                                            idDoctor:
                                                getPsicologo.psicologo!.id,
                                          )));
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
                                      builder: (context) => ComentariosListView(
                                          psicologo: getPsicologo.psicologo!)));
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
                                        builder: (context) => PerfilP(
                                              psicologo:
                                                  getPsicologo.psicologo!,
                                            )));
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
                                        builder: (context) => DeleteAccountView(
                                            id: getPsicologo.psicologo!.id)));
                              },
                            ),
                            Text(
                              'Configuración',
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
