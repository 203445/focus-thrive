import 'package:flutter/material.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/home.dart';
import 'package:focusthrive/register.dart';

class LoginPaciente extends StatefulWidget {
  const LoginPaciente({super.key});

  @override
  State<LoginPaciente> createState() => _LoginPacienteState();
}

class _LoginPacienteState extends State<LoginPaciente> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Image(
                            // alignment: Alignment.center,
                            image: AssetImage("assets/img/flor.png"),
                            width: 170),
                      ),
                      Flexible(
                        flex: 6,
                        child: Text(
                          "FocusThrive",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(126, 150, 170, 35),
                          ),
                          // textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: 450,
                    child: Column(
                      children: [
                        const Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(77, 95, 111, 35),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50, top: 50),
                          child: Form(
                            key: _formKey,
                            child: SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.280,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Correo electronico",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(4, 4, 4, 35),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: emailController,
                                      cursorColor:
                                          const Color.fromRGBO(11, 117, 133, 1),
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
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(4, 4, 4, 35),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: passwordController,
                                      cursorColor:
                                          const Color.fromRGBO(11, 117, 133, 1),
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
                                      obscureText: true,
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
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(11, 117, 133, 1),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Regístrate',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    )),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: OutlinedButton(
                      onPressed: () {
                        print('ok');
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                          // context.read<UsersBloc>().add(Register(
                          //     email: emailController.text,
                          //     password: passwordController.text));
                          print("ok");
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(11, 117, 133, 1),
                          elevation: 9),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Siguiente",
                          style:
                              TextStyle(fontSize: 22, color: Color(0xFFF1F1F1)),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
