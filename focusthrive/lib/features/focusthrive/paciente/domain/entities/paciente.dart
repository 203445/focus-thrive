class Paciente {
  final String id;
  final String nombre;
  final String apellidos;
  final String contrasena;
  final String urlFoto;
  final String numerotarjeta;
  final String correo;
  final String telefono;
  final bool esPremium;

  Paciente(
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
      'telefono': telefono,
      'correo': correo,
      'contrasena': contrasena,
      'numerotarjeta': numerotarjeta,
      'esPremium': esPremium,
      'urlFoto': urlFoto,
    };
  }

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      telefono: json['telefono'],
      correo: json['correo'],
      contrasena: json['passw'],
      numerotarjeta: json['ntarjeta'],
      esPremium: json['es_premium'],
      urlFoto: json['image'],
    );
  }
}
