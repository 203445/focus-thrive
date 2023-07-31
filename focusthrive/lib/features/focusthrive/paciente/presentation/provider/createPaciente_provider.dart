import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/usecases/create_profile_usecases.dart';

class CreatePacienteProvider extends ChangeNotifier {
  final CreateProfileUseCase createProfileUseCase;
  CreatePacienteProvider({required this.createProfileUseCase});
  bool response = false;
  bool loading = false;
  bool get loadingn => loading;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> createProfile(
      String nombre,
      String apellidos,
      File? urlFoto,
      String correo,
      String telefono,
      String contrasena,
      String esPremium,
      String numerotarjeta) async {
    setLoading(true);
    try {
      print('crear usuario');
      response = await createProfileUseCase.execute(nombre, apellidos, urlFoto,
          correo, telefono, contrasena, esPremium, numerotarjeta);
      // print(response);
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
