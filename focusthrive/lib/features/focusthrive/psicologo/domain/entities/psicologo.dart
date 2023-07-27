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
  final int rating;

  Psicologo(
      {required this.id,
      required this.nombre,
      required this.apellidos,
      required this.contrasena,
      required this.urlFoto,
      required this.numerotarjeta,
      required this.correo,
      required this.description,
      required this.ubicacion,
      required this.telefono,
      required this.rating});

  Map<String, dynamic> toMap() {
    return {
      'id:': id,
      'nombre': nombre,
      'apellidos': apellidos,
      'contrasena': contrasena,
      'url_foto_perfil': urlFoto,
      'numero_tarjeta': numerotarjeta,
      'rating': rating,
    };
  }

  factory Psicologo.fromJson(Map<String, dynamic> json) {
    return Psicologo(
      id: json['id'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      correo: json['correo'],
      contrasena: json['passw'],
      numerotarjeta: json['ntarjeta'],
      telefono: json['telefono'],
      urlFoto: json['image'],
      rating: json['raiting'],
      description: json['descripcion'],
      ubicacion: json['ubicacion'],
    );
  }
}
