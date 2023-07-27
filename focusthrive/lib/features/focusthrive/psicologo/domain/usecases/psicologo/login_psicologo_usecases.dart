import '../../repositories/psicologo_repository.dart';

class LoginPsicologoUseCase {
  final PsicologoRepository psicologorepository;

  LoginPsicologoUseCase(this.psicologorepository);

  Future<bool> execute(String correo, String password) async {
    return await psicologorepository.loginPsicologo(correo, password);
  }
}
