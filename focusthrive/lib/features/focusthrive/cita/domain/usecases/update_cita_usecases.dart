import '../repositories/cita_repository.dart';

class UpdateCitaUseCase {
  final CitaRepository citaRepository;

  UpdateCitaUseCase(this.citaRepository);

  Future<bool> execute(String id, String status) async {
    return await citaRepository.updateCita(id, status);
  }
}
