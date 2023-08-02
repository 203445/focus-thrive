import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/solicitud/domain/entities/solicitudes.dart';
import 'package:focusthrive/features/focusthrive/solicitud/domain/usecases/list_solicitud_usecases.dart';

class ListSolicitudProvider extends ChangeNotifier {
  final ListSolicitudUseCase listSolicitudUseCase;

  ListSolicitudProvider({required this.listSolicitudUseCase});
  List<SolicitudesC>? solicitudes;

  Future<void> listarSolicitud() async {
    solicitudes = (await listSolicitudUseCase.execute()).cast<SolicitudesC>();
    notifyListeners();
  }
}
