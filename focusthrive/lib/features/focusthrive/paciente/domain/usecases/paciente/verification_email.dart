import 'package:focusthrive/features/focusthrive/paciente/domain/repositories/paciente_repository.dart';

class VerificationEmailUseCase {
  final PacienteRepository pacienteRepository;

  VerificationEmailUseCase(this.pacienteRepository);

  // Future<bool> execute(String email) async {
  //   return await pacienteRepository.verificationEmail(email);
  // }
}
