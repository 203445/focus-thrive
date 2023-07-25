import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/cuentaP.dart';
import 'package:google_fonts/google_fonts.dart';

class AyudaP extends StatefulWidget {
  const AyudaP({super.key});

  @override
  _AyudaPState createState() => _AyudaPState();
}

class _AyudaPState extends State<AyudaP> {
  @override
  Widget build(BuildContext context) {
    //final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
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
                color: Color.fromRGBO(20, 148, 164, 1),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Ayuda",
              style: GoogleFonts.getFont(
                'Work Sans',
                textStyle: const TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(77, 95, 111, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: 290,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(211, 237, 234, 0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Preguntas Frecuentes",
                    style: GoogleFonts.getFont(
                      'Work Sans',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(102, 109, 149, 1),
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
                width: 230,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 255, 255, 1),
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
                        fontSize: 20,
                        color: Color.fromRGBO(102, 109, 149, 1),
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
                width: 230,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 255, 255, 1),
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
                        fontSize: 20,
                        color: Color.fromRGBO(102, 109, 149, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 290,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(211, 237, 234, 0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          17), // Bordes redondos con radio de 17
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Politicas y Privacidad",
                    style: GoogleFonts.getFont(
                      'Work Sans',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(102, 109, 149, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                width: 230,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 255, 255, 1),
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
                    "Seguridad",
                    style: GoogleFonts.getFont(
                      'Work Sans',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(102, 109, 149, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 290,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(211, 237, 234, 0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          17), // Bordes redondos con radio de 17
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Plan Premium",
                    style: GoogleFonts.getFont(
                      'Work Sans',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(102, 109, 149, 1),
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
    );
  }
}
