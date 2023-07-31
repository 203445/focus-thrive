import 'dart:io';

import 'package:focusthrive/features/focusthrive/solicitud/domain/entities/solicitudes.dart';

import '../../domain/repositories/solicitud_repository.dart';
import '../datasources/solicitud_remote.dart';

class SolicitudRepositoryImp extends SolicitudRepository {
  final SolicitudRemoteDataSource solicitudRemoteDataSource;

  SolicitudRepositoryImp({required this.solicitudRemoteDataSource});
  @override
  Future<SolicitudesC?> createSolicitud(
    String nombreP,
    String correo,
    String motivo,
    String idPaciente,
  ) async {
    return await solicitudRemoteDataSource.createSolicitud(
        nombreP, correo, motivo, idPaciente);
  }
}
