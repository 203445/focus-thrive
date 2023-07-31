import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';

import '../../repositories/psicologo_repository.dart';

class UpdatePsicologoUseCase {
  final PsicologoRepository psicologoRepository;

  UpdatePsicologoUseCase(this.psicologoRepository);

  Future<Psicologo?> execute(String id, String name, String apellido,
      String telefono, String correo) async {
    return await psicologoRepository.updatePsicologo(
        id, name, apellido, telefono, correo);
  }
}
