import '../../domain/entities/solicitudes.dart';

abstract class SolicitudRemoteDataSource {
  Future<SolicitudesC?> createSolicitud(
      String nombreP,
    String correo,
    String motivo,
    String idPaciente,);
}

class SolicitudRemoteDataSourceImp implements SolicitudRemoteDataSource {
  @override
  Future<SolicitudesC?> createSolicitud(String nombreP, String correo, String motivo, String idPaciente) {
    // TODO: implement createSolicitud
    throw UnimplementedError();
  }
}
 
