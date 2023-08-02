import '../../repositories/psicologo_repository.dart';

class DeletePsicologoUseCase {
  final PsicologoRepository psicologorepository;

  DeletePsicologoUseCase(this.psicologorepository);

  Future<bool> execute(String id) async {
    return await psicologorepository.delete(id);
  }
}
