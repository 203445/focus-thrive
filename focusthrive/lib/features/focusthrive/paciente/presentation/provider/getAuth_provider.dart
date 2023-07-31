import 'package:flutter/foundation.dart';
import '../../domain/entities/paciente.dart';
import '../../domain/usecases/get_paciente_usecases.dart';

class GetAuthProvider extends ChangeNotifier {
  final GetPacienteUseCase getPacienteUseCase;
  bool loading = false;
  Paciente? paciente;
  bool get loadingn => loading;

  GetAuthProvider({required this.getPacienteUseCase});

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  // Paciente? get paciente => _paciente;

  Future<void> getPaciente() async {
    setLoading(true);
    try {
      paciente = await getPacienteUseCase.execute('1');
      if (paciente != null) {
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
