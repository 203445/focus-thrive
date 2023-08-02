import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:focusthrive/features/focusthrive/paciente/presentation/pages/home.dart';

final dio = Dio();

class Question {
  String question;
  List<String> answers;

  Question(this.question, this.answers);
}

List<Question> questions = [
  Question(
    "Cuando tengo una fecha límite para hacer algo espero hasta el último momento para hacerlo",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Encuentro una excusa para hacer lo que no tenía que hacer",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Tiendo a perder mucho el tiempo",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Aplazo la toma de decisiones difíciles",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Casi siempre llego a tiempo a mis reuniones",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Cuando me canso de hacer una tarea, tiendo a aplazarla",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Cuando me aburro de una tarea, tiendo a aplazarla",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Me disgusta seguir pautas estrictas",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Sin tener que desarrollar otra actividad importante, aplazo realizar una tarea",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "No puedo cambiar mi hábito de perder mi tiempo",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Tiendo a descuidar las tareas que me son muy difíciles",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Me distraigo fácilmente cuando trato de concentrarme en hacer algo",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
  Question(
    "Cuando tomo una decisión , la cumplo",
    [
      "Siempre",
      "Casi siempre",
      "A veces",
      "Pocas Veces",
      "Nunca",
    ],
  ),
];

class SurveyView extends StatefulWidget {
  final String idUser;

  const SurveyView({super.key, required this.idUser});
  @override
  _SurveyViewState createState() => _SurveyViewState();
}

class _SurveyViewState extends State<SurveyView> {
  List<int?> selectedAnswers = List.filled(questions.length, null);

  void _handleRadioValueChanged(int questionIndex, int? newValue) {
    setState(() {
      selectedAnswers[questionIndex] = newValue;
    });
  }

  void _saveResponses() async {
    Map<String, String> responsesMap = {};
    for (int i = 0; i < questions.length; i++) {
      int? selectedAnswerIndex = selectedAnswers[i];
      if (selectedAnswerIndex != null) {
        String question = questions[i].question;
        String selectedAnswer = questions[i].answers[selectedAnswerIndex];
        print("Pregunta: $question - Respuesta seleccionada: $selectedAnswer");
        responsesMap[question] = selectedAnswer;
      }
    }
    final response = await dio.post("http://54.209.71.163/respuesta/create",
        data: json
            .encode({'respuestas': responsesMap, "id_usuario": widget.idUser}));

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: questions.length,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        itemBuilder: (context, index) {
          return _buildQuestionItem(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(20, 148, 164, 1),
        onPressed: _saveResponses,
        child: Icon(Icons.save),
      ),
    );
  }

  Widget _buildQuestionItem(int questionIndex) {
    Question question = questions[questionIndex];
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 0.70, // Ancho de la imagen
                    child: Image.asset(
                      "assets/img/flor.png",
                      fit: BoxFit.cover,
                      width: 70,
                    ),
                  ),
                ),
                const Text(
                  "FocusThrive",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(126, 150, 170, 35)),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Cuestionario",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(80, 83, 86, 1)),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15.0), // Ajusta el radio de borde aquí
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      question.question,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color.fromRGBO(80, 83, 86, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...question.answers.map((answer) {
                    int answerIndex = question.answers.indexOf(answer);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedAnswers[questionIndex] == answerIndex
                              ? const Color.fromRGBO(20, 148, 164, 1)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Card(
                        color: selectedAnswers[questionIndex] == answerIndex
                            ? const Color.fromRGBO(211, 237, 234, 1)
                            : Colors.white,
                        child: ListTile(
                          title: Text(
                            answer,
                            style: const TextStyle(
                                color: Color.fromRGBO(80, 83, 86, 1)),
                          ),
                          leading: Radio(
                            activeColor: const Color.fromRGBO(20, 148, 164, 1),
                            value: answerIndex,
                            groupValue: selectedAnswers[questionIndex],
                            onChanged: (int? newValue) {
                              _handleRadioValueChanged(questionIndex, newValue);
                            },
                          ),
                          onTap: () {
                            _handleRadioValueChanged(
                                questionIndex, answerIndex);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
