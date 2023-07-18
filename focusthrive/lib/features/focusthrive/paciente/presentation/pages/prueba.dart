import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Contenido
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 180,
                              height: 150,
                              child: Center(
                                child: Text(
                                  "Hola Miguel",
                                  style: GoogleFonts.getFont('Work Sans',
                                      textStyle: const TextStyle(
                                          fontSize: 35,
                                          color:
                                              Color.fromRGBO(102, 109, 149, 1),
                                          fontWeight: FontWeight.w300)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(46, 167, 217, 1),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/icons/clock.svg', // Ruta del archivo SVG del icono de GIF
                                        width:
                                            40, // Ajusta el tamaño del icono según tus necesidades
                                        height: 40, color: Colors.white70,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(16, 170, 130, 1),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      Icons.task,
                                      size: 40,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Tareas",
                                  style: GoogleFonts.getFont('Work Sans',
                                      textStyle: const TextStyle(
                                          fontSize: 35,
                                          color:
                                              Color.fromRGBO(102, 109, 149, 1),
                                          fontWeight: FontWeight.w300)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(20, 148, 164, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SizedBox(
                                  width: 300,
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Pendientes",
                                          style: GoogleFonts.getFont(
                                              'Work Sans',
                                              textStyle: const TextStyle(
                                                  fontSize: 24,
                                                  color: Color.fromRGBO(
                                                      102, 109, 149, 1),
                                                  fontWeight: FontWeight.w600)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(246, 35, 35, 0.89),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              '2',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(20, 148, 164, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SizedBox(
                                  width: 300,
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Por Hacer",
                                          style: GoogleFonts.getFont(
                                              'Work Sans',
                                              textStyle: const TextStyle(
                                                  fontSize: 24,
                                                  color: Color.fromRGBO(
                                                      102, 109, 149, 1),
                                                  fontWeight: FontWeight.w600)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(46, 167, 217, 1),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              '2',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(20, 148, 164, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SizedBox(
                                  width: 300,
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Terminadas",
                                          style: GoogleFonts.getFont(
                                              'Work Sans',
                                              textStyle: const TextStyle(
                                                  fontSize: 24,
                                                  color: Color.fromRGBO(
                                                      102, 109, 149, 1),
                                                  fontWeight: FontWeight.w600)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color.fromRGBO(
                                              16, 170, 130, 1),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              '2',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(20, 148, 164, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SizedBox(
                                  width: 300,
                                  // 149.7
                                  height: 125,
                                  
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Consejos del Día",
                                          style: GoogleFonts.getFont(
                                              'Work Sans',
                                              textStyle: const TextStyle(
                                                  fontSize: 24,
                                                  color: Color.fromRGBO(
                                                      102, 109, 149, 1),
                                                  fontWeight: FontWeight.w600)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Barra de navegación
                  Container(
                    height: 65,
                    color: Color.fromRGBO(11, 117, 133, 0.72),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 26,
                              ),
                              onPressed: () {
                                // Acción al presionar el ícono de inicio
                              },
                            ),
                            Text(
                              'Inicio',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.diamond,
                                color: Colors.white,
                                size: 26,
                              ),
                              onPressed: () {
                                // Acción al presionar el ícono de búsqueda
                              },
                            ),
                            Text(
                              'Premium',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
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
                                size: 26,
                              ),
                              onPressed: () {
                                // Acción al presionar el ícono de búsqueda
                              },
                            ),
                            Text(
                              'Perfil',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 26,
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => AyudaP()));
                              },
                            ),
                            Text(
                              'Notificación',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_rounded,
          size: 35,
          color: Colors.white,
        ),
        onPressed: () {
          // Acción al presionar el botón flotante
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30), // Ajusta el valor según tus necesidades
        ),
        backgroundColor: Color.fromRGBO(11, 117, 133, 1),
        focusElevation: 10,
      ),
      floatingActionButtonLocation: _CustomFloatingActionButtonLocation(
        FloatingActionButtonLocation.centerFloat,
        offset: Offset(0, -20),
      ),
    );
  }
}

class _CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  final FloatingActionButtonLocation delegate;
  final Offset offset;

  const _CustomFloatingActionButtonLocation(this.delegate,
      {required this.offset});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final Offset standardOffset = delegate.getOffset(scaffoldGeometry);
    return standardOffset + offset;
  }

  @override
  String toString() => 'CustomFloatingActionButtonLocation';
}
