import 'package:focusthrive/features/focusthrive/paciente/domain/entities/paciente.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class LoginPacienteUseCase {
  final PacienteRepository pacienterepository;

  LoginPacienteUseCase(this.pacienterepository);

  Future<bool> execute(String correo, String password) async {
    return await pacienterepository.loginPaciente(correo, password);
  }
}
