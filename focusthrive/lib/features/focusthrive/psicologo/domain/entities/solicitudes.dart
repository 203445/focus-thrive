class SolicitudesC {
  final String nombreUsuario;
  final String correo;
  final String motivo;

  final String idUsuario;

  SolicitudesC(
      {required this.nombreUsuario,
      required this.correo,
      required this.motivo,
      required this.idUsuario});

  Map<String, dynamic> toMap() {
    return {
      'nombre_usuario': nombreUsuario,
      'correo': correo,
      'motivo': motivo,
      'id_usuario': idUsuario,
    };
  }
}
