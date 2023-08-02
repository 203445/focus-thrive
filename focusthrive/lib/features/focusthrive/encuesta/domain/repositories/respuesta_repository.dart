import 'package:focusthrive/features/focusthrive/encuesta/domain/entities/respuesta.dart';

abstract class RespuestaRepository {
  // Future<bool> createRespuesta(String pregunta, String respuesta, String id);
  Future<bool> getRespuesta(String id);
}
