import 'package:flutter/material.dart';

class LoginPaciente extends StatefulWidget {
  const LoginPaciente({super.key});

  @override
  State<LoginPaciente> createState() => _LoginPacienteState();
}

class _LoginPacienteState extends State<LoginPaciente> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage("assets/img/flor.png"), width: 10),
              SizedBox(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height * 0.10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registrarse",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(10, 10, 10, 1),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Por favor, ingresa tus datos",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(10, 10, 10, 1)),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
