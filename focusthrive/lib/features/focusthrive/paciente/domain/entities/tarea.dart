class Tarea {
  final String id;
  final String titulo;
  final String description;
  final String fechaInicio;
  final String fechaFinal;
  final String userId;
  final String status;

  Tarea({
    required this.id,
    required this.titulo,
    required this.description,
    required this.fechaInicio,
    required this.fechaFinal,
    required this.userId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id:': id,
      'titulo': titulo,
      'descripcion': description,
      'fecha_inicio': fechaInicio,
      'fecha_fin': fechaFinal,
      'user_id': userId,
      'status': status,
    };
  }
}
