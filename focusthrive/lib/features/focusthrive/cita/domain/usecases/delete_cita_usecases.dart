import '../repositories/cita_repository.dart';

class DeleteCitaUseCase {
  final CitaRepository citaRepository;

  DeleteCitaUseCase(this.citaRepository);

  Future<bool> execute(
    String id,
  ) async {
    return await citaRepository.deleteCita(id);
  }
}
