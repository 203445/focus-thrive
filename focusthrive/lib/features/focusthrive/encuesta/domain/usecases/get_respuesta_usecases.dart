
import 'package:focusthrive/features/focusthrive/encuesta/domain/repositories/respuesta_repository.dart';

class GetRespuestaUseCase {
  final RespuestaRepository respuestaRepository;

  GetRespuestaUseCase(this.respuestaRepository);

  Future<bool> execute(
    String id,
  ) async {
    return await respuestaRepository.getRespuesta(id);
  }
}
