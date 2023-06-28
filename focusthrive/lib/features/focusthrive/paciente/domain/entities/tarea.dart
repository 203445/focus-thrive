class Tarea {
  final String id;
  final String titulo;
  final String description;
  final String fechaInicio;
  final String fechaFinal;

  Tarea({
    required this.id,
    required this.titulo,
    required this.description,
    required this.fechaInicio,
    required this.fechaFinal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id:': id,
      'titulo': titulo,
      'description': description,
      'fecha_inicio': fechaInicio,
      'fecha_fin': fechaFinal,
    };
  }
}
