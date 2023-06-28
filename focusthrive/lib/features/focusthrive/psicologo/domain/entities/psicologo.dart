class Psicologo {
  final String id;
  final String nombre;
  final String apellidos;
  final String contrasena;
  final String urlFoto;
  final String numerotarjeta;
  final String correo;
  final String telefono;
  final bool esPremium;

  Psicologo(
      {required this.id,
      required this.nombre,
      required this.apellidos,
      required this.contrasena,
      required this.urlFoto,
      required this.numerotarjeta,
      required this.correo,
      required this.telefono,
      required this.esPremium});

  Map<String, dynamic> toMap() {
    return {
      'id:': id,
      'nombre': nombre,
      'apellidos': apellidos,
      'contrasena': contrasena,
      'urlFoto': urlFoto,
      'numerotarjeta': numerotarjeta,
      'esPremium': esPremium
    };
  }
}
