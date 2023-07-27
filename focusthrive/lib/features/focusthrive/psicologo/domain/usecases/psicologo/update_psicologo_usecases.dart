import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';

import '../../repositories/psicologo_repository.dart';

class UpdatePsicologoUseCase {
  final PsicologoRepository psicologoRepository;

  UpdatePsicologoUseCase(this.psicologoRepository);

  Future<Psicologo?> execute() async {
    return await psicologoRepository.getPsicologo();
  }
}
