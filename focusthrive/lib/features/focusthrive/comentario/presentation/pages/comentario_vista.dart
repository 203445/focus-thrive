import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/comentario/presentation/pages/providers/get_comentario_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../psicologo/domain/entities/psicologo.dart';

class Comentario {
  final String nombreUsuario;
  final String descripcion;

  Comentario({
    required this.nombreUsuario,
    required this.descripcion,
  });
}

class ComentariosListView extends StatefulWidget {
  final Psicologo psicologo;

  const ComentariosListView({super.key, required this.psicologo});

  @override
  State<ComentariosListView> createState() => _ComentariosListViewState();
}

class _ComentariosListViewState extends State<ComentariosListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetComentarioProvider>(context, listen: false)
          .listComentario(widget.psicologo.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final listComentario = Provider.of<GetComentarioProvider>(context);
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
              "Tus comentarios",
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
        itemCount: listComentario.comentario?.length ?? 0,
        itemBuilder: (context, index) {
          final comentario = listComentario.comentario?[index];

          if (listComentario.comentario == [] ||
              listComentario.comentario!.isEmpty) {
            // Mostrar un mensaje o widget alternativo si no hay comentarios.
            return Center(
              child: Text('Aun no tienes comentarios.'),
            );
          } else {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('Usuario Anónimo'[8]),
                ),
                title: Text('Usuario Anónimo'),
                subtitle: Text(comentario!.description),
              ),
            );
          }
        },
      ),
    );
  }
}
