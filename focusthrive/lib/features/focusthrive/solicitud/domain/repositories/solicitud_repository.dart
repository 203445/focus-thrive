import '../entities/solicitudes.dart';

abstract class SolicitudRepository {
  Future<SolicitudesC?> createSolicitud(
    String nombreP,
    String correo,
    String motivo,
    String idPaciente,
  );
  Future<List<SolicitudesC?>> listSolicitud();
}
