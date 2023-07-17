class Suscripcion {
  final String id;
  final String userId;
  final String fechaInicio;
  final String fechaFin;
  final String fechaCancel;

  Suscripcion({
    required this.id,
    required this.userId,
    required this.fechaInicio,
    required this.fechaFin,
    required this.fechaCancel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id:': id,
      'user_id': userId,
      'fecha_inicio': fechaInicio,
      'fecha_fin': fechaFin,
      'fecha_cancelacion': fechaCancel,
    };
  }
}
