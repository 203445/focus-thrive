import 'package:focusthrive/features/focusthrive/cita/domain/entities/cita.dart';

import '../repositories/cita_repository.dart';

class GetCitaUseCase {
  final CitaRepository citaRepository;

  GetCitaUseCase(this.citaRepository);

  Future<List<Cita?>> execute(
    String id,
  ) async {
    return await citaRepository.getCita(id);
  }
}
