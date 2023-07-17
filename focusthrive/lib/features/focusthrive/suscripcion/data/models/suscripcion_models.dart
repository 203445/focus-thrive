import 'package:focusthrive/features/focusthrive/suscripcion/domain/entities/suscripcion.dart';

class SuscripcionModels extends Suscripcion {
  SuscripcionModels({
    required String id,
    required String userId,
    required String fechaInicio,
    required String fechaFin,
    required String fechaCancel,
  }) : super(
          id: id,
          userId: userId,
          fechaInicio: fechaInicio,
          fechaFin: fechaFin,
          fechaCancel: fechaCancel,
        );

  factory SuscripcionModels.fromJson(Map<String, dynamic> json) {
    return SuscripcionModels(
      id: json["id"].toString(),
      userId: json["user_id"].toString(),
      fechaInicio: json["fecha_inicio"].toString(),
      fechaFin: json["fecha_fin"].toString(),
      fechaCancel: json["fecha_cancelacion"].toString(),
    );
  }

  factory SuscripcionModels.fromEntity(Suscripcion suscripcion) {
    return SuscripcionModels(
      id: suscripcion.id,
      userId: suscripcion.userId,
      fechaInicio: suscripcion.fechaInicio,
      fechaFin: suscripcion.fechaFin,
      fechaCancel: suscripcion.fechaCancel,
    );
  }
}
