import 'package:focusthrive/features/focusthrive/solicitud/domain/repositories/solicitud_repository.dart';

import '../entities/solicitudes.dart';

class CreateSolicitudUseCase {
  final SolicitudRepository solicitidRepository;

  CreateSolicitudUseCase(this.solicitidRepository);

  Future<SolicitudesC?> execute(
    String nombreP,
    String correo,
    String motivo,
    String idPaciente,
  ) async {
    return await solicitidRepository.createSolicitud(
        nombreP, correo, motivo, idPaciente);
  }
}
