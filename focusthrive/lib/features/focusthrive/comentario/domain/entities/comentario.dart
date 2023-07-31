class Comentario {
  final String idDoctor;
  final String idPaciente;
  final String description;

  Comentario({
    required this.idDoctor,
    required this.idPaciente,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_doctor:': idDoctor,
      'id_paciente': idPaciente,
      'descripcion': description,
    };
  }

  factory Comentario.fromJson(Map<String, dynamic> json) {
    return Comentario(
      idDoctor: json['id_doctor'],
      idPaciente: json['id_paciente'],
      description: json['descripcion'],
    );
  }
}
