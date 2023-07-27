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

  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      id: json['id'],
      titulo: json['titulo'],
      description: json['descripcion'],
      fechaInicio: json['fecha_inicio'],
      fechaFinal: json['fecha_fin'],
      userId: json['user_id'],
      status: json['status'],
    );
  }
}
