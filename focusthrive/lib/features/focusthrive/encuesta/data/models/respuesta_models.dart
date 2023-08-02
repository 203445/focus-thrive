class RespuestaModel {
  final String pregunta;
  final String respuesta;

  RespuestaModel({required this.pregunta, required this.respuesta});

  // Método para mapear desde JSON a RespuestaModel
  factory RespuestaModel.fromJson(Map<String, dynamic> json) {
    return RespuestaModel(
      pregunta: json['pregunta'],
      respuesta: json['respuesta'],
    );
  }
}
