import 'package:flutter/foundation.dart';
import '../../domain/usecases/psicologo/updateImage_profile_usecases.dart';

class UpdatePsicologoDataProvider extends ChangeNotifier {
  final UpdatePsicologoProfileUseCase updateProfilePsicologoUseCase;
  UpdatePsicologoDataProvider({required this.updateProfilePsicologoUseCase});
  bool response = false;
  bool loading = false;
  bool get loadingn => loading;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> updatePsicologo(
    String id,
    String nombre,
    String apellidos,
    String telefono,
    String urlFoto,
    String descripcion,
    String ubicacion,
    String correo,
  ) async {
    setLoading(true);
    try {
      response = await updateProfilePsicologoUseCase.execute(id, nombre,
          apellidos, telefono, correo, descripcion, ubicacion, urlFoto);
      if (response == true) {
        notifyListeners();
        setLoading(false);
      } else {
        setLoading(false);
      }
    } catch (e) {
      print('Error al actualizar la cuenta  $e');
    }
  }
}
