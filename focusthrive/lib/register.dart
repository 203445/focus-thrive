import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/login.dart';
import 'package:focusthrive/main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/focusthrive/paciente/presentation/bloc/paciente_bloc.dart';
import 'features/focusthrive/paciente/presentation/widgets/buton.dart';
import 'features/focusthrive/paciente/presentation/widgets/error_views.dart';

import '../../../../usecase_config.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Registro> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  File? _file;
  late bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRect(
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 0.85, // Ancho de la imagen
                          child: Image.asset(
                            "assets/img/flor.png",
                            fit: BoxFit.cover,
                            width: 120,
                          ),
                        ),
                      ),
                      const Text(
                        "FocusThrive",
                        style: TextStyle(
                            fontSize: 35,
                            color: Color.fromRGBO(126, 150, 170, 35),
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Registro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      filled: true,
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          )),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Apellidos',
                      filled: true,
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          )),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _correoController,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      filled: true,
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          )),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          )),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    obscureText: !_passwordVisible,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Contraseña',
                      filled: true,
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          )),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(211, 237, 234, 0.358),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(20, 148, 164, 1)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    obscureText: !_passwordVisible,
                  ),
                ),
                const SizedBox(height: 25),
                customButton('Siguiente', () {
                  // Verifica si el formulario es válido antes de continuar
                  if (_nameController.text == '' ||
                      _lastNameController.text == '' ||
                      _passwordController.text == '' ||
                      _correoController.text == '' ||
                      _correoController.text == '') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Completa los campos'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      // Redirigir a la siguiente vista según la selección del usuario
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserTypeScreen(
                            name: _nameController.text,
                            lastName: _lastNameController.text,
                            email: _correoController.text,
                            password: _confirmPasswordController.text,
                            file: _file,
                          ),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Las contraseñas no coinciden.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cerrar'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                }, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserTypeScreen extends StatelessWidget {
  final String name;
  final String lastName;
  final String email;
  final String password;
  final File? file;

  final TextEditingController _cardNumberController = TextEditingController();

  UserTypeScreen(
      {super.key,
      required this.name,
      required this.lastName,
      required this.email,
      required this.password,
      required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipo de Usuario'),
      ),
      body: BlocBuilder<PacienteBloc, PacienteState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
                child: CircularProgressIndicator(
                    color: Color.fromRGBO(11, 117, 133, 1)));
          } else if (state is LoadedPage) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Selecciona tu tipo de usuario:'),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      // bool resultado = await usecaseConfig.createProfileUseCase!
                      //     .execute(name, lastName, file, email, '', password,
                      //         '', '');

                      // print(resultado);
                      context.read<PacienteBloc>().add(CreatePaciente(
                          nombre: name,
                          apellido: lastName,
                          urlfoto: file,
                          correo: email,
                          telefono: '',
                          password: password,
                          plan: "ninguno",
                          tarjeta: ""));

                    },
                    child: Text('Paciente'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Redirigir a la vista para psicólogos
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PsychologistScreen(
                            cardNumberController: _cardNumberController,
                          ),
                        ),
                      );
                    },
                    child: Text('Psicólogo'),
                  ),
                ],
              ),
            );
          } else if (state is PacienteCreado) {
            return Center(
              child: FutureBuilder(
                future: Future.delayed(Duration.zero, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPaciente()));
                }),
                builder: (BuildContext context, snapshot) {
                  return Container();
                },
              ),
            );
          } else if (state is Error) {
            return const ErrorView();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Paciente'),
      ),
      body: Center(
        child: Text('Formulario de Registro de Paciente'),
      ),
    );
  }
}

class PsychologistScreen extends StatelessWidget {
  final TextEditingController cardNumberController;

  PsychologistScreen({required this.cardNumberController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Psicólogo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: cardNumberController,
              decoration: InputDecoration(labelText: 'Número de Tarjeta'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Realizar el registro del psicólogo
                // ...

                // Mostrar mensaje de éxito
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Registro Exitoso'),
                      content: Text('El psicólogo ha sido registrado.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
