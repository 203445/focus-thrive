class Cita {
  final String nombreD;
  final String nombreP;
  final String motivo;
  final String status;
  final String horario;
  final String recomendaciones;
  final String idDoctor;
  final String idPaciente;

  Cita({
    required this.nombreD,
    required this.nombreP,
    required this.motivo,
    required this.status,
    required this.horario,
    required this.recomendaciones,
    required this.idDoctor,
    required this.idPaciente,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombreD:': nombreD,
      'nombreP': nombreP,
      'motivo': motivo,
      'status': status,
      'horario': horario,
      'recomendaciones': recomendaciones,
      'idDoctor': idDoctor,
      'idPaciente': idPaciente,
    };
  }

  factory Cita.fromJson(Map<String, dynamic> json) {
    return Cita(
      nombreD: json['nombre_doctor'],
      nombreP: json['nombre_paciente'],
      motivo: json['motivo'],
      status: json['status'],
      horario: json['horario'],
      recomendaciones: json['recomendaciones'],
      idDoctor: json['id_doctor'],
      idPaciente: json['id_usuario'],
    );
  }
}
