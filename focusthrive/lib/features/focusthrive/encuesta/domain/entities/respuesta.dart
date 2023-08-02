class Respuesta {
  final String pregunta;
  final String respuesta;

  Respuesta({required this.pregunta, required this.respuesta});

  factory Respuesta.fromJson(Map<String, dynamic> json) {
    return Respuesta(
      pregunta: json['pregunta'],
      respuesta: json['respuesta'],
    );
  }
}
