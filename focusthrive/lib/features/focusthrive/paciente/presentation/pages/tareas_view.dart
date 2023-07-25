import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/bloc/paciente_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Tarea extends StatefulWidget {
  const Tarea({super.key});

  @override
  State<Tarea> createState() => _TareasState();
}

class _TareasState extends State<Tarea> {
  final List<TodoItem> _todoItems = [
    TodoItem(
        title: 'Tarea 1',
        description:
            'Descripción de la tarea 1.Y QUE TAL SE ALARGA MAS EL TEXTIO ES UN PRUEBA, becesito u',
        date: '23 de Julio de 2023',
        completed: false),
    TodoItem(
        title: 'Tarea 2',
        description: 'Descripción de la tarea 2.',
        date: '24 de Julio de 2023',
        completed: false),
    TodoItem(
        title: 'Tarea 2',
        description: 'Descripción de la tarea 2.',
        date: '24 de Julio de 2023',
        completed: false),
    TodoItem(
        title: 'Tarea 2',
        description: 'Descripción de la tarea 2.',
        date: '24 de Julio de 2023',
        completed: false),
    TodoItem(
        title: 'Tarea 2',
        description: 'Descripción de la tarea 2.',
        date: '24 de Julio de 2023',
        completed: false),
    TodoItem(
        title: 'Tarea 2',
        description: 'Descripción de la tarea 2.',
        date: '24 de Julio de 2023',
        completed: false),
    TodoItem(
        title: 'Tarea 2',
        description: 'Descripción de la tarea 2.',
        date: '24 de Julio de 2023',
        completed: false),
    // Agrega más tareas aquí
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
      body:
          //BlocBuilder<PacienteBloc, PacienteState>(
          //   builder: (context, state) {
          //     if (state is Loading) {
          //       return Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.teal,
          //         ),
          //       );
          //     } else if (state is LoadedPage) {
          // final tareas = (state).tareas;
          ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          return TodoItemTile(
            todoItem: _todoItems[index],
          );
        },
      ),
      //     }
      //   },
      // ),
    );
  }
}

class TodoItem {
  final String title;
  final String description;
  final String date;
  bool completed;

  TodoItem({
    required this.title,
    required this.description,
    required this.date,
    required this.completed,
  });
}

class TodoItemTile extends StatefulWidget {
  final TodoItem todoItem;

  TodoItemTile({required this.todoItem});

  @override
  _TodoItemTileState createState() => _TodoItemTileState();
}

class _TodoItemTileState extends State<TodoItemTile> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
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
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });

                        print(_isChecked);
                      },
                    ),
                    title: Text(
                      widget.todoItem.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(widget.todoItem.description),
                        SizedBox(height: 5),
                        Text(
                          'Fecha: ${widget.todoItem.date}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 10),
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
                            onPrimary: Color.fromARGB(255, 134, 10, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: BorderSide(
                              color: Color.fromARGB(255, 217, 28, 41),
                              width: 1.0,
                            ),
                          ),
                          onPressed: () {},
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
