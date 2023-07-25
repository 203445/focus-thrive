import 'package:focusthrive/features/focusthrive/paciente/domain/entities/tarea.dart';

class TareaModel extends Tarea {
  TareaModel({
    required String id,
    required String titulo,
    required String description,
    required String fechaInicio,
    required String fechaFinal,
    required String userId,
    required String status,
  }) : super(
          id: id,
          titulo: titulo,
          description: description,
          fechaInicio: fechaInicio,
          fechaFinal: fechaFinal,
          userId: userId,
          status: status,
        );

  factory TareaModel.fromJson(Map<String, dynamic> json) {
    return TareaModel(
      id: json["id"].toString(),
      titulo: json["titulo"].toString(),
      description: json["descripcion"].toString(),
      fechaInicio: json["fecha_inicio"].toString(),
      fechaFinal: json["fecha_fin"].toString(),
      userId: json["user_id"].toString(),
      status: json["status"].toString(),
    );
  }

  factory TareaModel.fromEntity(Tarea tarea) {
    return TareaModel(
      id: tarea.id,
      titulo: tarea.titulo,
      description: tarea.description,
      fechaInicio: tarea.fechaInicio,
      fechaFinal: tarea.fechaFinal,
      userId: tarea.userId,
      status: tarea.status,
    );
  }
}
