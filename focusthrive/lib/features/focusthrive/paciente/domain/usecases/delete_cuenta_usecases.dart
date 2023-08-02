import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';


class DeletePacienteUseCase {
  final PacienteRepository pacienterepository;

  DeletePacienteUseCase(this.pacienterepository);

  Future<bool> execute(String id) async {
    return await pacienterepository.delete(id);
  }
}
