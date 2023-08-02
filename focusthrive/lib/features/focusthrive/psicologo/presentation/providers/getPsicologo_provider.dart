import 'package:flutter/foundation.dart';

import '../../domain/entities/psicologo.dart';
import '../../domain/usecases/psicologo/get_psicologo_usecases.dart';

class GetPsicologoProvider extends ChangeNotifier {
  final GetPsicologoUseCase getPsicologoUseCase;
  bool loading = false;
  Psicologo? psicologo;
  bool get loadingn => loading;

  GetPsicologoProvider({required this.getPsicologoUseCase});

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> getPaciente() async {
    setLoading(true);
    try {
      psicologo = await getPsicologoUseCase.execute();
      if (psicologo != null) {
        notifyListeners();
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
