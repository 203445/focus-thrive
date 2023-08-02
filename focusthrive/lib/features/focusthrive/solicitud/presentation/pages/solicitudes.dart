import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focusthrive/features/focusthrive/solicitud/presentation/providers/listSolicitud_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../cita/presentation/providers/createCitas_provider.dart';
import '../../../psicologo/domain/entities/psicologo.dart';

class Solicitudes extends StatefulWidget {
  final Psicologo psicologo;
  const Solicitudes({super.key, required this.psicologo});

  @override
  State<Solicitudes> createState() => _SolicitudesState();
}

class _SolicitudesState extends State<Solicitudes> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ListSolicitudProvider>(context, listen: false)
          .listarSolicitud();
    });
  }

  @override
  Widget build(BuildContext context) {
    final listSolicitud = Provider.of<ListSolicitudProvider>(context);
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
      body: ListView.builder(
        itemCount: listSolicitud.solicitudes?.length ?? 0,
        itemBuilder: (context, index) {
          final solicitud = listSolicitud.solicitudes?[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    // backgroundImage: AssetImage(solicitud.imagePath),
                    child: Text(solicitud!.nombreUsuario[0]),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(children: [
                      Text(
                        solicitud.nombreUsuario,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        solicitud.motivo,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
                  ),
                  TextButton(
                    onPressed: () async {
                      await openDialog(solicitud.idUsuario);
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
          );
        },
      ),
    );
  }

  Future openDialog(String idPaciente) async {
    TextEditingController nombreDController = TextEditingController();
    TextEditingController nombrePController = TextEditingController();
    TextEditingController motivoController = TextEditingController();
    TextEditingController recomendacionController = TextEditingController();
    final crearcita = Provider.of<CreateCitaProvider>(context, listen: false);
    var date = '';

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agendar Cita'),
          content: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Column(
                    children: [
                      TextField(

                        controller: nombreDController,
                        decoration: const InputDecoration(
                            labelText: 'Nombre del Doctor '),
                      ),
                      TextField(
                        controller: nombrePController,
                        decoration: const InputDecoration(
                            labelText: 'Nombre del Paciente'),
                      ),
                      TextField(
                        controller: motivoController,
                        decoration: const InputDecoration(labelText: 'Motivo'),
                      ),
                      TextField(
                        controller: recomendacionController,
                        decoration:
                            const InputDecoration(labelText: 'Recomendaciones'),
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () async {
                          DateTime? selectedDate =
                              await DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            locale: LocaleType.es,
                            onChanged: (date) {},
                            onConfirm: (selectedDate) {
                              // La variable selectedDate contendrá la fecha seleccionada por el usuario
                              if (selectedDate != null) {
                                setState(() {
                                  date = selectedDate.toString();
                                });
                              }
                            },
                            currentTime: DateTime.now(),
                            minTime: DateTime
                                .now(), // Establecer la fecha mínima como la fecha actual
                          );
                        },
                        child: const Text('Seleccionar Fecha'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Cerrar el diálogo sin guardar los datos
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                String nombreD = nombreDController.text;
                String nombreP = nombrePController.text;
                String mov = motivoController.text;
                String reco = recomendacionController.text;
                String fecha = date.toString();

                if (nombreD.isEmpty ||
                    nombreP.isEmpty ||
                    fecha.isEmpty ||
                    mov.isEmpty ||
                    reco.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Es necesario llenar todos los datos'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  await crearcita.createCita(
                    nombreD,
                    nombreP,
                    mov,
                    "Pendiente",
                    fecha,
                    reco,
                    widget.psicologo.id,
                    idPaciente,
                  );
                  if (crearcita.cita != null) {
                    Fluttertoast.showToast(
                      msg: 'Se creó la cita ',
                      toastLength: Toast
                          .LENGTH_SHORT, // Duración del toast (Toast.LENGTH_SHORT o Toast.LENGTH_LONG)
                      gravity: ToastGravity
                          .BOTTOM, // Posición del toast en la pantalla (TOP, CENTER, BOTTOM)
                      backgroundColor: Color.fromARGB(
                          255, 5, 137, 93), // Color de fondo del toast
                      textColor: Colors.white, // Color del texto del toast
                      fontSize: 16.0, // Tamaño de fuente del texto del toast
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: 'No se pudo crear la cita ',
                      toastLength: Toast
                          .LENGTH_SHORT, // Duración del toast (Toast.LENGTH_SHORT o Toast.LENGTH_LONG)
                      gravity: ToastGravity
                          .BOTTOM, // Posición del toast en la pantalla (TOP, CENTER, BOTTOM)
                      backgroundColor: Color.fromARGB(
                          255, 165, 0, 0), // Color de fondo del toast
                      textColor: Colors.white, // Color del texto del toast
                      fontSize: 16.0, // Tamaño de fuente del texto del toast
                    );
                  }
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pop();
                  });
                }
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
