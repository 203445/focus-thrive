class SolicitudesC {
  final String id;
  final String nombreUsuario;
  final String correo;
  final String motivo;

  final String idUsuario;

  SolicitudesC(
      {required this.id,
      required this.nombreUsuario,
      required this.correo,
      required this.motivo,
      required this.idUsuario});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre_usuario': nombreUsuario,
      'correo': correo,
      'motivo': motivo,
      'id_usuario': idUsuario,
    };
  }

  factory SolicitudesC.fromJson(Map<String, dynamic> json) {
    return SolicitudesC(
      id: json['id'],
      nombreUsuario: json['nombre_usuario'],
      correo: json['correo'],
      motivo: json['motivo'],
      idUsuario: json['id_usuario'],
    );
  }
}
