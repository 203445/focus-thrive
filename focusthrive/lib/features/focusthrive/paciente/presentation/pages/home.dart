import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/consejo.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/busqueda.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/login.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/perfil.dart';
import 'package:focusthrive/features/focusthrive/suscripcion/presentation/pages/suscription.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/tareas_view.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/timer.dart';
import 'package:focusthrive/main.dart';
import 'package:focusthrive/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../psicologo/domain/entities/cita.dart';
import '../../../psicologo/domain/entities/psicologo.dart';
import '../../domain/entities/paciente.dart';
import '../bloc/paciente_bloc.dart';
import '../widgets/error_views.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PacienteBloc, PacienteState>(builder: (context, state) {
        // if (state is VerificandoPaciente) {
        //   return const Center(
        //     child: CircularProgressIndicator(
        //       color: Color.fromRGBO(11, 117, 133, 1),
        //       //     ? DarkModeColors.accentColor
        //       //     : LightModeColors.accentColor,
        //     ),
        //   );
        // }
        // if (state is PacienteVerificado) {
        return SingleChildScrollView(
          child: Center(
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
                          SingleChildScrollView(
                            child: Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          height: 150,
                                          child: Center(
                                            child: Text(
                                              "Hola Miguel",
                                              style: GoogleFonts.getFont(
                                                  'Work Sans',
                                                  textStyle: const TextStyle(
                                                      fontSize: 35,
                                                      color: Color.fromRGBO(
                                                          102, 109, 149, 1),
                                                      fontWeight:
                                                          FontWeight.w300)),
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
                                                                  const Tarea()));
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
                                                      fontWeight:
                                                          FontWeight.w300)),
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
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Busqueda()));
                                              },
                                              child: SizedBox(
                                                width: 300,
                                                height: 80,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Pendientes",
                                                        style: GoogleFonts.getFont(
                                                            'Work Sans',
                                                            textStyle: const TextStyle(
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
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        alignment:
                                                            Alignment.center,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Text(
                                                            '2',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                              onTap: () async {
                                                // List<Tarea> tarea =
                                                //     await usecaseConfig
                                                //         .getTareaUseCase!
                                                //         .execute("1");

                                                // Paciente? paciente =
                                                //     await usecaseConfig
                                                //         .getPacienteUseCase!
                                                //         .execute('');

                                                // print(paciente!.correo);

                                                // List<Consejo?> consejo =
                                                //     await usecaseConfig
                                                //         .getConsejoUseCase!
                                                //         .execute("1");
                                                // bool tarea = await usecaseConfig
                                                //     .deleteTareaUseCase!
                                                //     .execute("1");
                                                // print(tarea);
                                                // print('aqui');

                                                // bool login = await usecaseConfig
                                                //     .loginPacienteUseCase!
                                                //     .execute(
                                                //         "asdasdad", "1234");
                                                // print(login);
                                                // Cita? cita = await usecaseConfig
                                                //     .createCitaUseCase!
                                                //     .execute(
                                                //         "Antonio",
                                                //         "agustin",
                                                //         "estres",
                                                //         "terminado",
                                                //         "21 de junio 10:00",
                                                //         "llegar puntual",
                                                //         "1",
                                                //         '2');

                                                // print(cita);
                                                // print(cita!.horario);
                                                // String token =
                                                //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImRhOWY0ZTg4LTE2OGUtNDg5ZS04N2IxLTMzZTAyMTFkZTAxOCIsImlhdCI6MTY5MDQwMDY3NCwiZXhwIjoxNjkwNDM2Njc0fQ.dX-Za0ACm7O9Imp_kPaekNYM9XJZfwi7WjJIsl8Egto';
                                                // Map<String, dynamic>
                                                //     decodedPayload =
                                                //     JwtDecoder.decode(token);
                                                // print(decodedPayload);

                                                // List<Cita?> cita =
                                                //     await usecaseConfig
                                                //         .getCitaUseCase!
                                                //         .execute("1");

                                                // print(cita);
                                                // for (int i = 0;
                                                //     i < cita.length;
                                                //     i++) {
                                                //   Cita? citaActual = cita[i];
                                                //   if (citaActual != null) {
                                                //     // Acceder a los campos de la entidad Cita
                                                //     String id =
                                                //         citaActual.nombreD;
                                                //     String titulo =
                                                //         citaActual.nombreP;
                                                //     String descripcion =
                                                //         citaActual.motivo;
                                                //     // ...
                                                //     // Hacer lo que necesites con los campos de la entidad
                                                //     print(
                                                //         "Cita $i: ID=$id, Título=$titulo, Descripción=$descripcion");
                                                //   }
                                                // }
                                                // bool response = await usecaseConfig
                                                //     .deleteCitaUseCase!
                                                //     .execute(
                                                //         '9e603fdf-792d-4b12-93fb-4ec04a4cc8bf');

                                                // print(response);
                                                // bool response = await usecaseConfig
                                                //     .createProfilePsicologoUseCase!
                                                //     .execute(
                                                //         "raul",
                                                //         "alvarez",
                                                //         "967191",
                                                //         "123",
                                                //         _file,
                                                //         "mucha infpormacion",
                                                //         "sas",
                                                //         "asdasd",
                                                //         "asas",
                                                //         "12");
                                                // print(response);
                                                // bool response =
                                                //     await usecaseConfig
                                                //         .loginPsicologoUseCase!
                                                //         .execute("asas", "123");
                                                // print(response);
                                                // Psicologo? psico =
                                                //     await usecaseConfig
                                                //         .getPsicologoUseCase!
                                                //         .execute();
                                                // print(psico!.nombre);
                                                // List<Psicologo?> psico =
                                                //     await usecaseConfig
                                                //         .getPsicologosUseCase!
                                                //         .execute();

                                                // for (int i = 0;
                                                //     i < psico.length;
                                                //     i++) {
                                                //   Psicologo? psicoActual =
                                                //       psico[i];
                                                //   if (psicoActual != null) {
                                                //     // Acceder a los campos de la entidad Cita
                                                //     String id =
                                                //         psicoActual.nombre;
                                                //     String titulo =
                                                //         psicoActual.id;
                                                //     int descripcion =
                                                //         psicoActual.rating;
                                                //     // ...
                                                //     // Hacer lo que necesites con los campos de la entidad
                                                //     print(
                                                //         "Cita $i: ID=$id, Título=$titulo, Descripción=$descripcion.");
                                                //   }
                                                // }
                                              },
                                              child: SizedBox(
                                                width: 300,
                                                height: 80,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Por Hacer",
                                                        style: GoogleFonts.getFont(
                                                            'Work Sans',
                                                            textStyle: const TextStyle(
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
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        alignment:
                                                            Alignment.center,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Text(
                                                            '2',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          102,
                                                                          109,
                                                                          149,
                                                                          1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color.fromRGBO(
                                                          16, 170, 130, 1),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
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
                                            print('aqui');
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
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
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
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Consejos para ti',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Work Sans',
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 22,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      102,
                                                                      109,
                                                                      149,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                    PremiumSubscriptionView()));
                                      },
                                    ),
                                    const Text(
                                      'Premium',
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
                                        Icons.person,
                                        color: Colors.white,
                                        size: 26,
                                      ),
                                      onPressed: () {
                                        // Acción al presionar el ícono de búsqueda
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
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Perfil()));
                                      },
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
        );
        // } else if (state is InitialState) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => OnboardingScreen()),
        //     );
        //   });
        // } else {
        //   return Container();
        // }
        // return Container();
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_rounded,
          size: 35,
          color: Colors.white,
        ),
        onPressed: () async {
          print("aqui");
          await openDialog();
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

  Future openDialog() async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descripController = TextEditingController();
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
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
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
                        child: Text('Seleccionar Fecha'),
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
                Navigator.of(context)
                    .pop(); // Cerrar el diálogo sin guardar los datos
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                String title = titleController.text;
                String descrip = descripController.text;
                String fecha = date.toString();
                String fechaI = DateTime.now().toString();

                if (title.isEmpty || descrip.isEmpty || fecha.isEmpty) {
                  // Mostrar mensaje de error si algún campo está vacío
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Es necesario llenar todos los datos'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  // await usecaseConfig.createTareaUseCase!
                  //   .execute(title, descrip, fechaI, fecha, "1", "porhacer");
                  context.read<PacienteBloc>().add(CreateTarea(
                      titulo: title,
                      description: descrip,
                      fechaInicio: fechaI,
                      fechaFinal: fecha,
                      userId: "1",
                      status: "porhacer"));
                  Navigator.of(context).pop();
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
