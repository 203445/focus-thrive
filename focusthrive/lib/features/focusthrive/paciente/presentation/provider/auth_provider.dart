import 'package:flutter/foundation.dart';
import '../../domain/usecases/login_paciente.dart';

class AuthProvider extends ChangeNotifier {
  final LoginPacienteUseCase loginPacienteUseCase;

  bool loading = false;
  bool get loadingn => loading;
  bool confirm = false;
  AuthProvider({required this.loginPacienteUseCase});

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  setVal(bool value) {
    confirm = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      confirm = await loginPacienteUseCase.execute(email, password);
      if (confirm) {
        setVal(true);
      }
      if (confirm) {
        setLoading(false);
      } else {
        setLoading(false);
      }
      notifyListeners();
    } catch (e) {
      setLoading(false);
      print('Error de Login  $e');
    }
  }
}
