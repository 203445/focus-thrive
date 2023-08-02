import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/provider/deletePaciente_provider.dart';
import 'package:focusthrive/features/focusthrive/tarea/presentation/provider/deleteTarea_provider.dart';

import 'package:focusthrive/features/focusthrive/tarea/presentation/provider/getTarea_provider.dart';
import 'package:focusthrive/features/focusthrive/tarea/presentation/provider/updateTarea_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../domain/entities/tarea.dart';

class TareaView extends StatefulWidget {
  final String id;
  const TareaView({super.key, required this.id});

  @override
  State<TareaView> createState() => _TareasState();
}

class _TareasState extends State<TareaView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<GetTareaProvider>(context, listen: false)
          .getTarea(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tareas = Provider.of<GetTareaProvider>(context);
    if (tareas.tarea?.length == 0 || tareas.tarea == null) {
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
                "Tareas por hacer",
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
        body: const Center(
          child: Text(
            'Aun no tienes tareas por hacer',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
          ),
        ),
      );
    } else {
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
                  "Tareas por hacer",
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
          body: ListView.separated(
            itemCount: tareas.tarea!.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              if (tareas.tarea != null && index < tareas.tarea!.length) {
                // Mostrar tarea pendiente
                return TodoItemTile(
                  tarea: tareas.tarea![index],
                  id: widget.id,
                );
              }
            },
          ));
    }
  }
}

class TodoItemTile extends StatefulWidget {
  final Tarea tarea;
  final String id;

  TodoItemTile({super.key, required this.tarea, required this.id});

  @override
  _TodoItemTileState createState() => _TodoItemTileState();
}

class _TodoItemTileState extends State<TodoItemTile> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final actuaTare = Provider.of<UpdateTareaProvider>(context);
    final delete = Provider.of<DeleteTareaProvider>(context);
    final tareas = Provider.of<GetTareaProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
      child: Center(
        child: SizedBox(
          width: 400, // Ancho del Container
          height: 200, // Alto del Container
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Checkbox(
                      value: _isChecked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Ajusta el valor según el radio deseado
                      ),
                      onChanged: (value) async {
                        if (_isChecked) {
                          await actuaTare.updateTarea(
                              widget.tarea.id, "porhacer");
                        } else {
                          await actuaTare.updateTarea(
                              widget.tarea.id, "terminada");
                        }
                        setState(() {
                          _isChecked = value!;
                        });
                        await Future.delayed(Duration.zero);
                        await tareas.getTarea(widget.id);
                      },
                    ),
                    title: Text(
                      widget.tarea.titulo,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(widget.tarea.description),
                        const SizedBox(height: 5),
                        Text(
                          'Fecha: ${widget.tarea.fechaFinal}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: const Color.fromARGB(255, 134, 10, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 217, 28, 41),
                              width: 1.0,
                            ),
                          ),
                          onPressed: () async {
                            print(widget.tarea.status);
                            if (widget.tarea.status == "terminada") {
                              await delete.delteTarea(widget.tarea.id);
                              await Future.delayed(Duration.zero);
                              await tareas.getTarea(widget.id);
                              Fluttertoast.showToast(
                                msg: 'Se elimino correctamente ',
                                toastLength: Toast
                                    .LENGTH_SHORT, // Duración del toast (Toast.LENGTH_SHORT o Toast.LENGTH_LONG)
                                gravity: ToastGravity
                                    .BOTTOM, // Posición del toast en la pantalla (TOP, CENTER, BOTTOM)
                                backgroundColor: const Color.fromARGB(255, 1,
                                    119, 101), // Color de fondo del toast
                                textColor:
                                    Colors.white, // Color del texto del toast
                                fontSize:
                                    16.0, // Tamaño de fuente del texto del toast
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Aun no haz terminado la actividad',
                                toastLength: Toast
                                    .LENGTH_SHORT, // Duración del toast (Toast.LENGTH_SHORT o Toast.LENGTH_LONG)
                                gravity: ToastGravity
                                    .BOTTOM, // Posición del toast en la pantalla (TOP, CENTER, BOTTOM)
                                backgroundColor: const Color.fromARGB(255, 119,
                                    27, 1), // Color de fondo del toast
                                textColor:
                                    Colors.white, // Color del texto del toast
                                fontSize:
                                    16.0, // Tamaño de fuente del texto del toast
                              );
                            }
                          },
                          child: Text(
                            "Eliminar",
                            style: GoogleFonts.getFont(
                              'Work Sans',
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(193, 16, 16, 0.788),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
