class Consejo {
  final String id;
  final String description;

  Consejo({
    required this.id,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id:': id,
      'descripcion': description,
    };
  }

  factory Consejo.fromJson(Map<String, dynamic> json) {
    return Consejo(
      id: json['id'],
      description: json['descripcion'],
    );
  }
}
