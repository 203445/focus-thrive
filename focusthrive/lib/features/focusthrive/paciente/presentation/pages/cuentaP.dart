import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CuentaP extends StatefulWidget {
  const CuentaP({super.key});

  @override
  _CuentaPState createState() => _CuentaPState();
}

class _CuentaPState extends State<CuentaP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 254, 254),
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
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              " Cuenta",
              style: GoogleFonts.getFont(
                'Work Sans',
                textStyle: const TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(102, 109, 149, 1),
                  fontWeight: FontWeight.w300,
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
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 30),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                // controller: emailController,
                                cursorColor:
                                    const Color.fromRGBO(11, 117, 133, 1),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  fillColor: const Color.fromRGBO(
                                      211, 237, 234, 0.358),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(20, 148, 164, 1),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(20, 148, 164, 1),
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                ),
                                style: const TextStyle(fontSize: 20),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, ingresa un usuario';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                // controller: emailController,
                                cursorColor:
                                    const Color.fromRGBO(11, 117, 133, 1),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  fillColor: const Color.fromRGBO(
                                      211, 237, 234, 0.358),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(20, 148, 164, 1),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(20, 148, 164, 1),
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.email),
                                ),
                                style: const TextStyle(fontSize: 20),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, ingresa un correo electrónico';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                cursorColor:
                                    const Color.fromRGBO(11, 117, 133, 1),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  fillColor: const Color.fromRGBO(
                                      211, 237, 234, 0.358),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(20, 148, 164, 1),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(20, 148, 164, 1),
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.lock),
                                ),
                                style: const TextStyle(fontSize: 20),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, ingresa una contraseña';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                // controller: emailController,
                                cursorColor:
                                    const Color.fromRGBO(11, 117, 133, 1),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  fillColor: const Color.fromRGBO(
                                      211, 237, 234, 0.358),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(20, 148, 164, 1),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(20, 148, 164, 1),
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.phone),
                                ),
                                style: const TextStyle(fontSize: 20),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, ingresa un número de teléfono';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80),
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
                        "Guardar",
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
        ),
      ),
    );
  }
}
