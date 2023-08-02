import '../entities/cita.dart';

abstract class CitaRepository {
  Future<Cita?> createCita(
      String nombreD,
      String nombreP,
      String motivo,
      String status,
      String horario,
      String recomendaciones,
      String idDoctor,
      String idPaciente);

  Future<List<Cita?>> getCita(String id);
  Future<List<Cita?>> getCitaPaciente(String id);
  Future<bool> deleteCita(String id);
  Future<bool> updateCita(String id, String status);
}
