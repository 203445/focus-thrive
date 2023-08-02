import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/widgets/paciente_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../psicologo/presentation/providers/getAllPsicologo_provider.dart';
import '../../../solicitud/presentation/providers/crearSolicitud_provider.dart';
import '../../domain/entities/paciente.dart';

class Busqueda extends StatefulWidget {
  final String idPaciente;
  final Paciente paciente;
  const Busqueda({super.key, required this.idPaciente, required this.paciente});

  @override
  State<Busqueda> createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllPsicologoProvider>(context, listen: false)
          .getPaciente();
    });
  }

  @override
  Widget build(BuildContext context) {
    final getPsicologos = Provider.of<GetAllPsicologoProvider>(context);
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
              "Psicólogos",
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: getPsicologos.psicologo?.length ?? 0,
                      itemBuilder: (context, index) {
                        return PsicologoList(
                          userData: getPsicologos.psicologo![index],
                          idPaciente: widget.idPaciente,
                        );
                      },
                    ),
                    // child: Center(
                    //   child: Text('Contenido de la pantalla'),
                    // ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_rounded,
          size: 35,
          color: Colors.white,
        ),
        onPressed: () async {
          await openDialog();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30), // Ajusta el valor según tus necesidades
        ),
        backgroundColor: const Color.fromRGBO(11, 117, 133, 1),
        focusElevation: 10,
      ),
    );
  }

  Future openDialog() async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descripController = TextEditingController();
    final solicitud =
        Provider.of<CrearSolicitudProvider>(context, listen: false);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar una Solicitud'),
          content: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Column(
                    children: [
                      TextField(
                        controller: descripController,
                        decoration: const InputDecoration(labelText: 'Motivo'),
                      ),
                      const SizedBox(height: 20),
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
                String descrip = descripController.text;
                if (descrip.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Es necesario llenar todos los datos'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  await solicitud.createSolicitud(widget.paciente.nombre,
                      widget.paciente.correo, descrip, widget.paciente.id);
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
