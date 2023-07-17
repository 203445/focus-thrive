import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';

class PsicologoModels extends Psicologo {
  PsicologoModels(
      {required String id,
      required String nombre,
      required String apellidos,
      required String urlFoto,
      required String correo,
      required String telefono,
      required String contrasena,
      required String numerotarjeta})
      : super(
            id: id,
            nombre: nombre,
            apellidos: apellidos,
            urlFoto: urlFoto,
            correo: correo,
            telefono: telefono,
            contrasena: contrasena,
            numerotarjeta: numerotarjeta);

  factory PsicologoModels.fromJson(Map<String, dynamic> json) {
    return PsicologoModels(
        id: json["id"].toString(),
        nombre: json["nombre"].toString(),
        apellidos: json["apellidos"].toString(),
        urlFoto: json["url_foto_perfil"].toString(),
        correo: json["correo"].toString(),
        telefono: json["telefono"].toString(),
        contrasena: json["contrasena"].toString(),
        numerotarjeta: json["numero_tarjeta"].toString());
  }

  factory PsicologoModels.fromEntity(Psicologo psicologo) {
    return PsicologoModels(
        id: psicologo.id,
        nombre: psicologo.nombre,
        apellidos: psicologo.apellidos,
        urlFoto: psicologo.urlFoto,
        correo: psicologo.correo,
        telefono: psicologo.telefono,
        contrasena: psicologo.contrasena,
        numerotarjeta: psicologo.numerotarjeta);
  }
}
