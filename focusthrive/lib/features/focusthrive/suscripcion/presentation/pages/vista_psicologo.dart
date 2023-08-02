import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/comentario/domain/entities/comentario.dart';

import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../comentario/presentation/pages/providers/create_comentario_provider.dart';
import '../../../comentario/presentation/pages/providers/get_comentario_provider.dart';
import '../../../paciente/presentation/notification/notification_api.dart';

class VistaP extends StatefulWidget {
  final Psicologo userData;
  final String idPaciente;
  const VistaP({super.key, required this.userData, required this.idPaciente});

  @override
  State<VistaP> createState() => _VistaPState();
}

class _VistaPState extends State<VistaP> {
  final TextEditingController _commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.userData.id);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetComentarioProvider>(context, listen: false)
          .listComentario(widget.userData.id);
    });
  }

  @override
  void dispose() {
    // Step 1: Liberar el TextEditingController cuando el widget se descarte.
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createComentario = Provider.of<CreateComentarioProvider>(context);
    final listComentario = Provider.of<GetComentarioProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(210, 233, 237, 0.925),
      appBar: AppBar(
        title: Text(widget.userData.nombre),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'http://54.83.165.193${widget.userData.urlFoto}',
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
                      widget.userData.ubicacion,
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
                          SizedBox(height: 5),
                          Text(
                            widget.userData.telefono,
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
                            widget.userData.correo,
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
                      widget.userData.description,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        // if (await canLaunch(_url))
                        // await launch(_url, forceSafariVC: false);
                        var whatsappUrl = Uri.parse(
                            "whatsapp://send?phone=+52${widget.userData.telefono}" +
                                "&text=${Uri.encodeComponent("Buenas tardes")}");
                        try {
                          launchUrl(whatsappUrl);
                        } catch (e) {
                          debugPrint(e.toString());
                        }
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
                    onPressed: () async {
                      String commentText = _commentController.text;
                      await createComentario.createComentario(
                          widget.idPaciente, widget.userData.id, commentText);
                      print('Comentario enviado: $commentText');
                      await showNotification(
                          title: widget.userData.nombre,
                          body: 'Gracias por tu comentario');

                      await listComentario.listComentario(widget.userData.id);
                      _commentController.clear();
                    },
                    child: Text('Enviar'),
                  ),
                  // Lista de comentarios
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listComentario.comentario?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (listComentario.comentario == [] ||
                          listComentario.comentario?.length == 0) {
                        // Mostrar un mensaje o widget alternativo si no hay comentarios.
                        return Center(
                          child: Text('No hay comentarios disponibles.'),
                        );
                      } else {
                        // Mostrar los comentarios utilizando CommentCard.
                        return CommentCard(
                          comment: listComentario.comentario![index],
                        );
                      }
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

class CommentCard extends StatelessWidget {
  final Comentario comment;

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
              'Autor: Un usuario ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(comment.description),
          ],
        ),
      ),
    );
  }
}
