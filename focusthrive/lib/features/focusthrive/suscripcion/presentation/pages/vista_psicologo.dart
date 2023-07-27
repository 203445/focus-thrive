import 'package:flutter/material.dart';

class VistaP extends StatefulWidget {
  const VistaP({super.key});

  @override
  State<VistaP> createState() => _VistaPState();
}

class _VistaPState extends State<VistaP> {
  List<Comment> comments = [
    Comment(author: 'Usuario 1', text: '¡Excelente psicólogo! Lo recomiendo.'),
    Comment(author: 'Usuario 2', text: 'Muy profesional y amable.'),
    Comment(author: 'Usuario w', text: 'Muy profesional y amable.'),
    Comment(author: 'Usuario w', text: 'Muy profesional y amable.'),
    Comment(author: 'Usuario 1', text: '¡Excelente psicólogo! Lo recomiendo.'),
    Comment(author: 'Usuario 1', text: '¡Excelente psicólogo! Lo recomiendo.'),
    Comment(author: 'Usuario 1', text: '¡Excelente psicólogo! Lo recomiendo.'),
    Comment(author: 'Usuario 1', text: '¡Excelente psicólogo! Lo recomiendo.'),
    Comment(author: 'Usuario 1', text: '¡Excelente psicólogo! Lo recomiendo.'),
    // Agrega más comentarios aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(210, 233, 237, 0.925),
      appBar: AppBar(
        title: Text('Nombre del Psicólogo'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/img/157.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color.fromRGBO(11, 117, 133, 1),
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
                      'Ubicación del Psicólogo bla bla bla bla bla bla bla bl la la bla bla bla bla bla bl bla bla bla bla bla blla bla bla bla bla bla bla bla bla bla bla bla',
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
                          Text(
                            'Número del Psicólogo',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '123456789',
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
                          Text(
                            'Correo del Psicólogo',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'correo@psicologo.com',
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
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción del Psicólogo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Aquí va la descripción del psicólogo...',
                      style: TextStyle(fontSize: 14),
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
