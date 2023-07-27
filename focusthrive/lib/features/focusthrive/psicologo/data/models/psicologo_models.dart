import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';

class PsicologoModels extends Psicologo {
  PsicologoModels(
      {required String id,
      required String nombre,
      required String apellidos,
      required String contrasena,
      required String urlFoto,
      required String correo,
      required String descripcion,
      required String ubicacion,
      required String telefono,
      required String numerotarjeta,
      required int rating})
      : super(
          id: id,
          nombre: nombre,
          apellidos: apellidos,
          contrasena: contrasena,
          urlFoto: urlFoto,
          correo: correo,
          description: descripcion,
          ubicacion: ubicacion,
          telefono: telefono,
          numerotarjeta: numerotarjeta,
          rating: rating,
        );

  factory PsicologoModels.fromJson(Map<String, dynamic> json) {
    return PsicologoModels(
        id: json["id"].toString(),
        nombre: json["nombre"].toString(),
        apellidos: json["apellidos"].toString(),
        contrasena: json["contrasena"].toString(),
        urlFoto: json["url_foto_perfil"].toString(),
        correo: json["correo"].toString(),
        descripcion: json["descripcion"].toString(),
        ubicacion: json["ubicacion"].toString(),
        telefono: json["telefono"].toString(),
        numerotarjeta: json["numero_tarjeta"].toString(),
        rating: json["rating "]);
  }

  factory PsicologoModels.fromEntity(Psicologo psicologo) {
    return PsicologoModels(
      id: psicologo.id,
      nombre: psicologo.nombre,
      apellidos: psicologo.apellidos,
      urlFoto: psicologo.urlFoto,
      contrasena: psicologo.contrasena,
      correo: psicologo.correo,
      descripcion: psicologo.description,
      ubicacion: psicologo.ubicacion,
      telefono: psicologo.telefono,
      numerotarjeta: psicologo.numerotarjeta,
      rating: psicologo.rating,
    );
  }
}
