import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Modelo de ejemplo para representar un comentario
class Comentario {
  final String nombreUsuario;
  final String descripcion;

  Comentario({
    required this.nombreUsuario,
    required this.descripcion,
  });
}

class ComentariosListView extends StatelessWidget {
  // Datos de ejemplo para los comentarios
  final List<Comentario> comentarios = [
    Comentario(
      nombreUsuario: 'Ana Flores',
      descripcion: '¡Excelente servicio! Me encanta.',
    ),
    Comentario(
      nombreUsuario: 'Jose Ochoa',
      descripcion: 'Sin duda volería a ir.',
    ),

    // Agrega más comentarios aquí si lo deseas
  ];

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
        itemCount: comentarios.length,
        itemBuilder: (context, index) {
          final comentario = comentarios[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(comentario.nombreUsuario[0]),
              ),
              title: Text(comentario.nombreUsuario),
              subtitle: Text(comentario.descripcion),
            ),
          );
        },
      ),
    );
  }
}

