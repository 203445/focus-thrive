import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Solicitudes extends StatefulWidget {
  const Solicitudes({super.key});

  @override
  State<Solicitudes> createState() => _SolicitudesState();
}

class _SolicitudesState extends State<Solicitudes> {
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
              "Solicitudes",
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
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: 320,
              height: 100,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/num.jpg'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Rodrigo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(20, 148, 164, 1)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      'Abrir',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 320,
            height: 100,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(20, 148, 164, 1)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/img/image.jpeg'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Juan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Acción al presionar el botón
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(20, 148, 164, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Text(
                    'Abrir',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Agrega más cajas aquí según sea necesario
        ],
      ),
    );
  }
}
