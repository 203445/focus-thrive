import 'package:focusthrive/features/focusthrive/solicitud/domain/repositories/solicitud_repository.dart';

import '../entities/solicitudes.dart';

class ListSolicitudUseCase {
  final SolicitudRepository solicitidRepository;

  ListSolicitudUseCase(this.solicitidRepository);

  Future<List<SolicitudesC?>> execute() async {
    return await solicitidRepository.listSolicitud();
  }
}
