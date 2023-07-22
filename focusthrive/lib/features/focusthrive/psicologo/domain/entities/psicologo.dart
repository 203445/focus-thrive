class Psicologo {
  final String id;
  final String nombre;
  final String apellidos;
  final String contrasena;
  final String urlFoto;
  final String numerotarjeta;
  final String correo;
  final String description;
  final String ubicacion;
  final String telefono;

  Psicologo({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.contrasena,
    required this.urlFoto,
    required this.numerotarjeta,
    required this.correo,
    required this.description,
    required this.ubicacion,
    required this.telefono,
  });

  Map<String, dynamic> toMap() {
    return {
      'id:': id,
      'nombre': nombre,
      'apellidos': apellidos,
      'contrasena': contrasena,
      'url_foto_perfil': urlFoto,
      'numero_tarjeta': numerotarjeta,
    };
  }
}
