import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:focusthrive/features/focusthrive/encuesta/presentation/providers/get_respuestas_provider.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/busqueda.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/perfil.dart';
import 'package:focusthrive/features/focusthrive/suscripcion/presentation/pages/suscription.dart';
import 'package:focusthrive/features/focusthrive/tarea/presentation/tareas_view.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../consejo/presentation/providers/get_consejos_providers.dart';
import '../../../tarea/presentation/provider/addTarea_provider.dart';

import '../provider/getAuth_provider.dart';
import 'encuesta.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAuthProvider>(context, listen: false).getPaciente();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetConsejoProvider>(context, listen: false).getConsejo('1');
    });
  }

  @override
  Widget build(BuildContext context) {
    final getPaciente = Provider.of<GetAuthProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetRespuestaPacienteProvider>(context, listen: false)
          .listRespuestaPaciente(getPaciente.paciente!.id);
    });
    final getConsejo = Provider.of<GetConsejoProvider>(context);
    final respuesta = Provider.of<GetRespuestaPacienteProvider>(context);

    if (respuesta.respuesta == false) {
      return SurveyView(
        idUser: getPaciente.paciente!.id,
      );
    } else {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          // Contenido
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      height: 150,
                                      child: Center(
                                        child: Text(
                                          "Hola ${getPaciente.paciente?.nombre} ",
                                          style: GoogleFonts.getFont(
                                              'Work Sans',
                                              textStyle: const TextStyle(
                                                  fontSize: 35,
                                                  color: Color.fromRGBO(
                                                      102, 109, 149, 1),
                                                  fontWeight: FontWeight.w300)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  46, 167, 217, 1),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: IconButton(
                                              icon: SvgPicture.asset(
                                                'assets/icons/clock.svg', // Ruta del archivo SVG del icono de GIF
                                                width:
                                                    40, // Ajusta el tamaño del icono según tus necesidades
                                                height: 40,
                                                color: Colors.white70,
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const CountdownPage()));
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  16, 170, 130, 1),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: IconButton(
                                                icon: const Icon(Icons.task,
                                                    size: 40),
                                                color: Colors.white70,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TareaView(
                                                              id: getPaciente
                                                                  .paciente!.id,
                                                            )),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          "Tareas",
                                          style: GoogleFonts.getFont(
                                              'Work Sans',
                                              textStyle: const TextStyle(
                                                  fontSize: 35,
                                                  color: Color.fromRGBO(
                                                      102, 109, 149, 1),
                                                  fontWeight: FontWeight.w300)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  20, 148, 164, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 300,
                                            height: 80,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Pendientes",
                                                    style: GoogleFonts.getFont(
                                                        'Work Sans',
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 24,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        102,
                                                                        109,
                                                                        149,
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        246, 35, 35, 0.89),
                                                  ),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        '1',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  20, 148, 164, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {},
                                          child: SizedBox(
                                            width: 300,
                                            height: 80,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Por Hacer",
                                                    style: GoogleFonts.getFont(
                                                        'Work Sans',
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 24,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        102,
                                                                        109,
                                                                        149,
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        46, 167, 217, 1),
                                                  ),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        '1',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  20, 148, 164, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: SizedBox(
                                          width: 300,
                                          height: 80,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Terminadas",
                                                  style: GoogleFonts.getFont(
                                                      'Work Sans',
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 24,
                                                              color:
                                                                  Color
                                                                      .fromRGBO(
                                                                          102,
                                                                          109,
                                                                          149,
                                                                          1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(
                                                      16, 170, 130, 1),
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      '2',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                    GestureDetector(
                                      onTap: () {
                                        showDialogWithMessage(
                                            context,
                                            'Consejo del día',
                                            '${getConsejo.consejo![2].description} ');
                                      },
                                      child: Container(
                                        height: 160,
                                        margin: EdgeInsets.all(20),
                                        child: Card(
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex:
                                                    1, // La mitad izquierda (imagen) ocupa 1 de 2 flex
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                    ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/img/tips.png'),
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex:
                                                    2, // La mitad derecha (fondo con texto) ocupa 1 de 2 flex
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        167,
                                                        227,
                                                        251,
                                                        1), // Puedes cambiar el color del fondo aquí
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20),
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Consejos para ti',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Work Sans',
                                                        textStyle:
                                                            const TextStyle(
                                                          fontSize: 22,
                                                          color: Color.fromRGBO(
                                                              102, 109, 149, 1),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Barra de navegación
                          Container(
                            height: 75,
                            color: Color.fromRGBO(11, 117, 133, 0.72),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.home,
                                        color: Colors.white,
                                        size: 26,
                                      ),
                                      onPressed: () {},
                                    ),
                                    const Text(
                                      'Inicio',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    if (getPaciente.paciente?.esPremium ==
                                        false)
                                      SizedBox(
                                        width: 50, // Ancho del Stack
                                        height: 60,
                                        child: Stack(children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.diamond,
                                              color: Colors.white,
                                              size: 26,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PremiumSubscriptionView(),
                                                ),
                                              );
                                            },
                                          ),
                                          Positioned(
                                            right: -1,
                                            bottom: -2.5,
                                            child: const Text(
                                              'Premium',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    if (getPaciente.paciente?.esPremium == true)
                                      SizedBox(
                                        width: 50, // Ancho del Stack
                                        height: 60,
                                        child: Stack(children: [
                                          IconButton(
                                            icon: SvgPicture.asset(
                                              'assets/icons/help-outline.svg', // Ruta del archivo SVG del icono de GIF
                                              width:
                                                  40, // Ajusta el tamaño del icono según tus necesidades
                                              height: 39,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Busqueda(
                                                            idPaciente:
                                                                getPaciente
                                                                    .paciente!
                                                                    .id,
                                                            paciente:
                                                                getPaciente
                                                                    .paciente!,
                                                          )));
                                            },
                                          ),
                                          Positioned(
                                            right: 3,
                                            bottom: -2,
                                            child: const Text(
                                              'Apoyo',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 26,
                                      ),
                                      onPressed: () {
                                        // WidgetsBinding.instance
                                        //     .addPostFrameCallback((_) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Perfil()));
                                        // });
                                      },
                                    ),
                                    const Text(
                                      'Perfil',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.notifications,
                                        color: Colors.white,
                                        size: 26,
                                      ),
                                      onPressed: () {},
                                    ),
                                    const Text(
                                      'Notificación',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_rounded,
            size: 35,
            color: Colors.white,
          ),
          onPressed: () async {
            await openDialog(getPaciente.paciente!.id);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30), // Ajusta el valor según tus necesidades
          ),
          backgroundColor: const Color.fromRGBO(11, 117, 133, 1),
          focusElevation: 10,
        ),
        floatingActionButtonLocation: const _CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerFloat,
          offset: Offset(0, -25),
        ),
      );
    }
  }

  Future openDialog(String id) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descripController = TextEditingController();
    final tareas = Provider.of<AddTareaProvider>(context, listen: false);
    var date = '';

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar Tarea'),
          content: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: 'Titulo'),
                      ),
                      TextField(
                        controller: descripController,
                        decoration:
                            const InputDecoration(labelText: 'Descripción'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          DateTime? selectedDate =
                              await DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            onChanged: (date) {},
                            onConfirm: (selectedDate) {
                              // La variable selectedDate contendrá la fecha seleccionada por el usuario
                              if (selectedDate != null) {
                                setState(() {
                                  date = selectedDate.toString();
                                });
                              }
                            },
                            currentTime: DateTime.now(),
                            minTime: DateTime
                                .now(), // Establecer la fecha mínima como la fecha actual
                          );
                        },
                        child: const Text('Seleccionar Fecha'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                print(id);
                Navigator.of(context)
                    .pop(); // Cerrar el diálogo sin guardar los datos
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                String title = titleController.text;
                String descrip = descripController.text;
                String fecha = date.toString();
                String fechaI = DateTime.now().toString();

                if (title.isEmpty || descrip.isEmpty || fecha.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Es necesario llenar todos los datos'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  await tareas.createTarea(
                    title,
                    descrip,
                    fechaI,
                    fecha,
                    id,
                    "porhacer",
                  );
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

class _CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  final FloatingActionButtonLocation delegate;
  final Offset offset;

  const _CustomFloatingActionButtonLocation(this.delegate,
      {required this.offset});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final Offset standardOffset = delegate.getOffset(scaffoldGeometry);
    return standardOffset + offset;
  }

  @override
  String toString() => 'CustomFloatingActionButtonLocation';
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
