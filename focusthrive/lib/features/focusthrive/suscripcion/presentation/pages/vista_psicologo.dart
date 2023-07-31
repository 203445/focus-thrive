import 'package:flutter/material.dart';

import '../../../paciente/presentation/pages/busqueda.dart';

class VistaP extends StatefulWidget {
  final UserData userData;
  const VistaP({super.key, required this.userData});

  @override
  State<VistaP> createState() => _VistaPState();
}

class _VistaPState extends State<VistaP> {
  List<Comment> comments = [
    Comment(
        author: 'Mónica Chacón', text: '¡Excelente psicólogo! Lo recomiendo.'),
    Comment(author: 'Gabriel Mendoza', text: 'Muy profesional y amable.'),

    // Agrega más comentarios aquí
  ];
  // Step 1: Agrega un TextEditingController
  final TextEditingController _commentController = TextEditingController();

  // Step 2: Función para manejar el envío del comentario
  void _sendComment() {
    String commentText = _commentController.text;

    print('Comentario enviado: $commentText');
    // Limpiamos el TextField después de enviar el comentario.
    _commentController.clear();
  }

  @override
  void dispose() {
    // Step 1: Liberar el TextEditingController cuando el widget se descarte.
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(210, 233, 237, 0.925),
      appBar: AppBar(
        title: Text(widget.userData.name),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/img/ok.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color.fromARGB(255, 97, 149, 157),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    width: 50,
                  ),
                  Flexible(
                    child: Text(
                      'Andador Berlín #207 Col. Potrero Mirador',
                      // Especifica una cantidad máxima de líneas para el texto
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          SizedBox(height: 10),
                          // Text(
                          //   'Número del Psicólogo',
                          //   style: TextStyle(fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(height: 5),
                          Text(
                            '961 1205691',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.mail),
                          SizedBox(height: 10),
                          SizedBox(height: 5),
                          Text(
                            'javier@gmail.com',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      ' Con más de 10 años de experiencia en el campo de la psicología clínica. Tanatólogo',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para contactar al psicólogo
                      },
                      child: Text('Contactar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comentarios de otros usuarios',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Step 3: Agrega el TextFormField y el botón "Enviar"
                  TextFormField(
                    controller: _commentController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu comentario aquí',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _sendComment,
                    child: Text('Enviar'),
                  ),
                  // Lista de comentarios
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return CommentCard(comment: comments[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideBox extends StatelessWidget {
  final String title;
  final String content;

  SideBox({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(content),
        ],
      ),
    );
  }
}

class Comment {
  String author;
  String text;

  Comment({required this.author, required this.text});
}

class CommentCard extends StatelessWidget {
  final Comment comment;

  CommentCard({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Autor: ${comment.author}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(comment.text),
          ],
        ),
      ),
    );
  }
}
