import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/psicologo.dart';
import '../providers/updateData_provider.dart';

class DataEntryScreen extends StatefulWidget {
  final Psicologo psicologo;

  const DataEntryScreen({super.key, required this.psicologo});
  @override
  _DataEntryScreenState createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    descripcionController.text = widget.psicologo.description;
    ubicacionController.text = widget.psicologo.ubicacion;
  }

  @override
  Widget build(BuildContext context) {
    final updateData = Provider.of<UpdatePsicologoDataProvider>(context);
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
              "Perfil",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: widget.psicologo.nombre,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  filled: true,
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 148, 164, 1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 148, 164, 1)),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                readOnly: true,
                initialValue: widget.psicologo.apellidos,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  filled: true,
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 148, 164, 1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 148, 164, 1)),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                maxLines: 10,
                controller: descripcionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  filled: true,
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 148, 164, 1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 148, 164, 1)),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: ubicacionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Ubicación',
                  filled: true,
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 148, 164, 1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 148, 164, 1)),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  String description = descripcionController.text;
                  String ubicacion = ubicacionController.text;

                  if (descripcionController.text != '' ||
                      ubicacionController.text != '') {
                    await updateData.updatePsicologo(
                        widget.psicologo.id,
                        widget.psicologo.nombre,
                        widget.psicologo.apellidos,
                        widget.psicologo.telefono,
                        widget.psicologo.urlFoto,
                        description,
                        ubicacion,
                        widget.psicologo.correo);
                    descripcionController.text = description;
                    ubicacionController.text = ubicacion;

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
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
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
