import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/bloc/paciente_bloc.dart';

class ErrorView extends StatefulWidget {
  const ErrorView({super.key});

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            BlocBuilder<PacienteBloc, PacienteState>(builder: (context, state) {
          if (state is Error) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.175,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ups, ha ocurrido un error",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            " Regresando a la página anterior...",
                            // ${state.error} 
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: CircularProgressIndicator(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        }));
  }
}
