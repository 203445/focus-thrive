import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/usecases/psicologo/login_psicologo_usecases.dart';

class AuthPsicologoProvider extends ChangeNotifier {
  final LoginPsicologoUseCase loginPsicologoUseCase;

  bool loading = false;
  bool get loadingn => loading;
  bool confirm = false;
  AuthPsicologoProvider({required this.loginPsicologoUseCase});

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
      confirm = await loginPsicologoUseCase.execute(email, password);
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
