import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../domain/usecases/psicologo/create_profile_usecases.dart';

class CreatePsicologoProvider extends ChangeNotifier {
  final CreateProfilePsicologoUseCase createProfilePsicologoUseCase;
  CreatePsicologoProvider({required this.createProfilePsicologoUseCase});
  bool response = false;
  bool loading = false;
  bool get loadingn => loading;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> createPsicologo(
    String nombre,
    String apellidos,
    String telefono,
    String contrasena,
    File? urlFoto,
    String descripcion,
    String ubicacion,
    String numerotarjeta,
    String correo,
    String rating,
  ) async {
    setLoading(true);
    try {
      print('crear usuario');
      response = await createProfilePsicologoUseCase.execute(
          nombre,
          apellidos,
          telefono,
          contrasena,
          urlFoto,
          descripcion,
          ubicacion,
          numerotarjeta,
          correo,
          rating);
      if (response == true) {
        notifyListeners();
        setLoading(false);
      } else {
        setLoading(false);
      }
    } catch (e) {
      print('Error al crear la cuenta  $e');
    }
  }
}
