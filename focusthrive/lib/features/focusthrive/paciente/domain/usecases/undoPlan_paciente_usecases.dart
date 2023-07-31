import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class UndoPlanPacienteUseCase {
  final PacienteRepository pacienterepository;

  UndoPlanPacienteUseCase(this.pacienterepository);

  Future<bool> execute(String id) async {
    return await pacienterepository.undoPlanPaciente(id);
  }
}
