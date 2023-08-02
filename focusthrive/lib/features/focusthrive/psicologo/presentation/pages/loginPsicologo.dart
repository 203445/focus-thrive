import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:focusthrive/features/focusthrive/psicologo/presentation/pages/home.dart';
import 'package:focusthrive/register.dart';
import 'package:provider/provider.dart';

import '../../../paciente/presentation/widgets/buton.dart';
import '../providers/authPsicologo_provider.dart';

class LoginPsicologo extends StatefulWidget {
  const LoginPsicologo({super.key});

  @override
  State<LoginPsicologo> createState() => _LoginPacienteState();
}

class _LoginPacienteState extends State<LoginPsicologo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  late bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final loginpsicologo = Provider.of<AuthPsicologoProvider>(context);

    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
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
                              width: 130,
                            ),
                          ),
                        ),
                        const Text(
                          "FocusThrive",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(126, 150, 170, 35)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 450,
                      child: Column(
                        children: [
                          const Text(
                            "Iniciar Sesión",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 95, 111, 35),
                            ),
                          ),
                          const Text(
                            "Psicólogos",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 95, 111, 35),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50, top: 30),
                            child: Form(
                              key: _formKey,
                              child: SizedBox(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height *
                                      0.290,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Correo electronico",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(4, 4, 4, 35),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: emailController,
                                        cursorColor: const Color.fromRGBO(
                                            11, 117, 133, 1),
                                        decoration: InputDecoration(
                                          filled: true,
                                          errorBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(28)),
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.red,
                                              )),
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(28)),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.red,
                                            ),
                                          ),
                                          fillColor: const Color.fromRGBO(
                                              211, 237, 234, 0.358),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(28),
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    20, 148, 164, 1)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(28),
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    20, 148, 164, 1)),
                                          ),
                                        ),
                                        style: const TextStyle(fontSize: 20),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Por favor, ingresa un correo electrónico';
                                          } else if (!RegExp(emailRegex)
                                              .hasMatch(value)) {
                                            return 'Ingresa un correo electrónico válido';
                                          }
                                          return null;
                                        },
                                      ),
                                      const Text(
                                        'Contraseña',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(4, 4, 4, 35),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        cursorColor: const Color.fromRGBO(
                                            11, 117, 133, 1),
                                        decoration: InputDecoration(
                                          filled: true,
                                          errorBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(28)),
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.red,
                                              )),
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(28)),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.red,
                                            ),
                                          ),
                                          fillColor: const Color.fromRGBO(
                                              211, 237, 234, 0.358),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(28),
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    20, 148, 164, 1)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(28),
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    20, 148, 164, 1)),
                                          ),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
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
                                        style: const TextStyle(fontSize: 20),
                                        obscureText: !_passwordVisible,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Por favor, ingresa una contraseña';
                                          } else if (!RegExp(passwordRegex)
                                              .hasMatch(value)) {
                                            return 'La contraseña debe tener al menos 8 caracteres, una letra y un número';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Registro()));
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                text: '¿Aún no tienes una cuenta?        ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(11, 117, 133, 1),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Regístrate',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      )),
                  customButton(loginpsicologo.loading ? 'Cargando' : 'Entrar',
                      () async {
                    if (_formKey.currentState!.validate()) {
                      await loginpsicologo.login(
                          emailController.text, passwordController.text);

                      if (loginpsicologo.confirm == true) {
                        emailController.clear();
                        passwordController.clear();
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePs()));
                        });
                      } else {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          showDialogWithMessage(
                              context,
                              'Error al iniciar sesión',
                              'Hubo un problema al intentar iniciar sesión. Por favor, inténtalo de nuevo.');
                        });
                      }
                    }
                  }, context),
                ],
              ),
            ),
          ),
        ));
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
