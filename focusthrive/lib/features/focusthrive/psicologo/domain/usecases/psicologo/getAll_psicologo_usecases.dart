import 'package:focusthrive/features/focusthrive/psicologo/domain/entities/psicologo.dart';

import '../../repositories/psicologo_repository.dart';

class GetAllPsicologoUseCase {
  final PsicologoRepository psicologoRepository;

  GetAllPsicologoUseCase(this.psicologoRepository);

  Future<List<Psicologo?>> execute() async {
    return await psicologoRepository.getAllPsicologos();
  }
}
