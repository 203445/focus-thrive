import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
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
                            color: Color.fromRGBO(102, 109, 149, 1),
                            fontWeight: FontWeight.w300)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(46, 167, 217, 1),
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
                        color: const Color.fromRGBO(16, 170, 130, 1),
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
                            color: Color.fromRGBO(102, 109, 149, 1),
                            fontWeight: FontWeight.w300)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const SizedBox(
                    width: 300,
                    height: 80,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const SizedBox(
                    width: 300,
                    height: 80,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  width: 300,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2, top: 6),
                          child: Text("Hola"),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
