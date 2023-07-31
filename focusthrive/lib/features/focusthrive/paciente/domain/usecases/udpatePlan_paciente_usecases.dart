import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class UpdatePlanPacienteUseCase {
  final PacienteRepository pacienterepository;

  UpdatePlanPacienteUseCase(this.pacienterepository);

  Future<bool> execute(String id) async {
    return await pacienterepository.updatePlanPaciente(id);
  }
}
