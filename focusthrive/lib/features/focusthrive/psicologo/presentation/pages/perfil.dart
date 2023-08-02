import 'dart:io';

import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/pages/cuentaPsicologo.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/pages/infoPerfil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../paciente/presentation/pages/ayuda.dart';
import '../../domain/entities/psicologo.dart';
import '../providers/getPsicologo_provider.dart';
import '../providers/updatePsicologo-provider.dart';

class PerfilP extends StatefulWidget {
  final Psicologo psicologo;
  const PerfilP({super.key, required this.psicologo});

  @override
  State<PerfilP> createState() => _PerfilState();
}

class _PerfilState extends State<PerfilP> {
  File? _profileimage;

  Future getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) {
      return;
    }
    setState(() {
      _profileimage = File(img.path);
    });

    print(_profileimage);
  }

  @override
  Widget build(BuildContext context) {
    final psicologo = Provider.of<GetPsicologoProvider>(context);
    final update = Provider.of<UpdatePsicologoProvider>(context);
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                Stack(children: [
                  CircleAvatar(
                    backgroundImage: _profileimage != null
                        ? Image.file(_profileimage!).image
                        : Image.network(
                                'http://54.83.165.193${widget.psicologo.urlFoto}')
                            .image,
                    radius: 100,
                  ),
                  if (_profileimage != null)
                    Positioned(
                        right: 5,
                        bottom: 10,
                        child: FloatingActionButton.small(
                          onPressed: () async {
                            await update.updatePsicologo(
                                widget.psicologo.id,
                                widget.psicologo.nombre,
                                widget.psicologo.apellidos,
                                widget.psicologo.telefono,
                                _profileimage,
                                widget.psicologo.description,
                                widget.psicologo.ubicacion,
                                widget.psicologo.correo);
                            if (update.response == true) {
                              await psicologo.getPaciente();
                            } else {
                              print('Error al actualizar ');
                            }
                          },
                          backgroundColor: Colors.white,
                          //
                          child: const Icon(Icons.save,
                              color: Color.fromRGBO(11, 117, 133, 1)),
                        )),
                  if (_profileimage == null)
                    Positioned(
                        right: 5,
                        bottom: 10,
                        child: FloatingActionButton.small(
                          onPressed: () {
                            getImage();
                          },
                          backgroundColor: Colors.white,
                          //
                          child: const Icon(Icons.edit,
                              color: Color.fromRGBO(11, 117, 133, 1)),
                        )),
                ]),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    top: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(211, 237, 234, 0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: 245,
                      height: 70,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Francisco Javier",
                          style: GoogleFonts.getFont('Work Sans',
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  color: Color.fromRGBO(77, 95, 111, 1),
                                  fontWeight: FontWeight.w400)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 245,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
                          MaterialPageRoute(
                              builder: (context) => CuentaPsicologo(
                                    psicologo: widget.psicologo,
                                  )),
                        );
                      },
                      child: Text(
                        "Cuenta",
                        style: GoogleFonts.getFont(
                          'Work Sans',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(77, 95, 111, 1),
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
                    width: 245,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
                          MaterialPageRoute(
                              builder: (context) => DataEntryScreen(
                                    psicologo: psicologo.psicologo!,
                                  )),
                        );
                      },
                      child: Text(
                        "Mi perfil",
                        style: GoogleFonts.getFont(
                          'Work Sans',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(77, 95, 111, 1),
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
                    width: 245,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: const Color.fromRGBO(20, 148, 164, 1),
                          width: 1.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AyudaP()));
                      },
                      child: Text(
                        "Ayuda",
                        style: GoogleFonts.getFont(
                          'Work Sans',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(77, 95, 111, 1),
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
                    width: 245,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: const Color.fromRGBO(20, 148, 164, 1),
                          width: 1.0,
                        ),
                      ),
                      onPressed: () async {},
                      child: Text(
                        "Cerrar Sesión",
                        style: GoogleFonts.getFont(
                          'Work Sans',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Color.fromRGBO(77, 95, 111, 1),
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
