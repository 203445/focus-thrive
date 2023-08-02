import 'package:flutter/foundation.dart';

import '../../domain/entities/psicologo.dart';
import '../../domain/usecases/psicologo/getAll_psicologo_usecases.dart';

class GetAllPsicologoProvider extends ChangeNotifier {
  final GetAllPsicologoUseCase getAllPsicologoUseCase;
  bool loading = false;
  List<Psicologo>? psicologo;
  bool get loadingn => loading;

  GetAllPsicologoProvider({required this.getAllPsicologoUseCase});

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> getPaciente() async {
    setLoading(true);
    try {
      psicologo = (await getAllPsicologoUseCase.execute()).cast<Psicologo>();

      psicologo?.forEach((psico) {
        print(psico.nombre); // Imprime el nombre de cada psicólogo en la lista
      });
      if (psicologo != null) {
        Future.delayed(Duration.zero, () {
          notifyListeners();
        });
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
