import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/login.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/provider/createPaciente_provider.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/pages/loginPsicologo.dart';
import 'package:focusthrive/stripe_service.dart';
import 'package:provider/provider.dart';

import 'features/focusthrive/paciente/presentation/widgets/buton.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // final TextEditingController _cardNumberController = TextEditingController();
  File? _file;
  late bool _passwordVisible = false;
  // Limpia el controlador
  void clearController() {
    _passwordController.clear();
    _nameController.clear();
    _lastNameController.clear();
    _confirmPasswordController.clear();
    _correoController.clear();
  }

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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa un correo electrónico';
                      } else if (!RegExp(emailRegex).hasMatch(value)) {
                        return 'Ingresa un correo electrónico válido';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa una contraseña';
                      } else if (!RegExp(passwordRegex).hasMatch(value)) {
                        return 'La contraseña debe tener al menos 8 caracteres, una letra y un número';
                      }
                      return null;
                    },
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
                      _correoController.text == '') {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      showDialogWithMessage(
                          context, 'Error', 'Completa los campos');
                    });
                  } else {
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      clearController();
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
                      SchedulerBinding.instance.addPostFrameCallback(
                        (_) {
                          showDialogWithMessage(
                              context, 'Error', 'Las contraseñas no coinciden');
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

  const UserTypeScreen(
      {super.key,
      required this.name,
      required this.lastName,
      required this.email,
      required this.password,
      required this.file});

  @override
  Widget build(BuildContext context) {
    final crearP = Provider.of<CreatePacienteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipo de Usuario'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Selecciona tu tipo de usuario:'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await crearP.createProfile(
                      name, lastName, file, email, "", password, "");
                  if (crearP.response == false) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      showDialogWithMessage(context, 'Error al registrarse',
                          'Es posible que ya exista este correo. Por favor, inténtalo de nuevo.');
                    });
                  } else {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      showDialogWithMessage(
                          context, 'Success', 'Registro correcto');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPaciente(),
                        ),
                      );
                    });
                  }
                },
                child: const Text('Paciente'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var items = [
                    {
                      'productPrice': 110,
                      'productName': 'Subscripción de cada mes',
                      'qty': 1
                    }
                  ];

                  await StripeService.stripePaymentCheckout(
                      items, 100, context, 1, onSuccess: () {
                    print('SUCCES');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPsicologo()));
                  }, onCancel: () {
                    print('CANCEL');
                  }, onError: (e) {
                    print('ERROR:' + e.toString());
                  });
                },
                child: Text('Psicólogo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
