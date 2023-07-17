class SolicitudesC {
  final String id;
  final String nombreUsuario;
  final String correo;
  final String motivo;
  final String status;
  final String idUsuario;

  SolicitudesC(
      {required this.id,
      required this.nombreUsuario,
      required this.correo,
      required this.motivo,
      required this.status,
      required this.idUsuario});

  Map<String, dynamic> toMap() {
    return {
      'id:': id,
      'nombre': nombreUsuario,
      'correo': correo,
      'motivo': motivo,
      'status': status,
      'id_usuario': idUsuario,
    };
  }
}
