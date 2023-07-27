import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';

import '../../repositories/psicologo_repository.dart';

class GetPsicologoUseCase {
  final PsicologoRepository psicologoRepository;

  GetPsicologoUseCase(this.psicologoRepository);

  Future<Psicologo?> execute() async {
    return await psicologoRepository.getPsicologo();
  }
}
