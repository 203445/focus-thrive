import 'package:flutter/material.dart';

import '../../domain/entities/solicitudes.dart';
import '../../domain/usecases/create_solicitud_usecases.dart';

class CrearSolicitudProvider extends ChangeNotifier {
  final CreateSolicitudUseCase createSolicitudUseCase;

  CrearSolicitudProvider({required this.createSolicitudUseCase});
  SolicitudesC? solicitudesC;

  Future<void> createSolicitud(
      String nombreU, String correo, String motivo, String idUser) async {
    try {
      solicitudesC =
          await createSolicitudUseCase.execute(nombreU, correo, motivo, idUser);

      if (solicitudesC != null) {
        notifyListeners();
      } else {
        await Future.delayed(const Duration(milliseconds: 2500), () {
          notifyListeners();
        });
      }
    } catch (e) {
      print('Error de Login  $e');
    }
  }
}
