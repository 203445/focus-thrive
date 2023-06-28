import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';

class PacienteModel extends Paciente {
  PacienteModel(
      {required String id,
      required String nombre,
      required String apellidos,
      required String urlFoto,
      required String correo,
      required String telefono,
      required String contrasena,
      required bool esPremium,
      required String numerotarjeta})
      : super(
            id: id,
            nombre: nombre,
            apellidos: apellidos,
            urlFoto: urlFoto,
            correo: correo,
            telefono: telefono,
            contrasena: contrasena,
            esPremium: esPremium,
            numerotarjeta: numerotarjeta);

  factory PacienteModel.fromJson(Map<String, dynamic> json) {
    return PacienteModel(
        id: json["id"].toString(),
        nombre: json["nombre"].toString(),
        apellidos: json["apellidos"].toString(),
        urlFoto: json["urlFoto"].toString(),
        correo: json["correo"].toString(),
        telefono: json["telefono"].toString(),
        contrasena: json["contrasena"].toString(),
        esPremium: json["premium"],
        numerotarjeta: json["numerotarjeta"].toString());
  }

  factory PacienteModel.fromEntity(Paciente paciente) {
    return PacienteModel(
        id: paciente.id,
        nombre: paciente.nombre,
        apellidos: paciente.apellidos,
        urlFoto: paciente.urlFoto,
        correo: paciente.correo,
        telefono: paciente.telefono,
        contrasena: paciente.contrasena,
        esPremium: paciente.esPremium,
        numerotarjeta: paciente.numerotarjeta);
  }
}
