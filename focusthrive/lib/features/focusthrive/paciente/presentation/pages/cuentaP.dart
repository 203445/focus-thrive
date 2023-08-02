import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/paciente.dart';
import '../provider/updateData_provider.dart';

class CuentaP extends StatefulWidget {
  final Paciente paciente;
  const CuentaP({
    super.key,
    required this.paciente,
  });

  @override
  _CuentaPState createState() => _CuentaPState();
}

class _CuentaPState extends State<CuentaP> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nombreController.text = widget.paciente.nombre;
    apellidoController.text = widget.paciente.apellidos;
    correoController.text = widget.paciente.correo;
    telefonoController.text = widget.paciente.telefono;
  }

  @override
  Widget build(BuildContext context) {
    final updateData = Provider.of<UpdatePacienteDataProvider>(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
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
                "Cuenta",
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
                                  controller: nombreController,
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
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
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
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: apellidoController,
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
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
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
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: correoController,
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
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
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
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  controller: telefonoController,
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
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
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
                        onPressed: () async {
                          String nombre = nombreController.text;
                          String apellido = apellidoController.text;
                          String correo = correoController.text;
                          String telefono = telefonoController.text;

                          if (nombreController.text != '' ||
                              apellidoController.text != '' ||
                              correoController.text != '' ||
                              telefonoController.text != '') {
                            await updateData.updatePacienteData(
                                widget.paciente.id,
                                nombre,
                                apellido,
                                correo,
                                telefono,
                                widget.paciente.urlFoto);
                            nombreController.text = nombre;
                            apellidoController.text = apellido;
                            correoController.text = correo;
                            telefonoController.text = telefono;

                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              showDialogWithMessage(
                                  context, 'Éxito', 'Cambios guardados');
                            });
                          } else {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              showDialogWithMessage(
                                  context, 'Error', 'Completa los campos');
                            });
                          }
                        },
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
        ));
  }
}

void showDialogWithMessage(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
