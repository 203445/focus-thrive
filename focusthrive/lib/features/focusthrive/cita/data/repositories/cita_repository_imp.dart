import '../../domain/entities/cita.dart';
import '../../domain/repositories/cita_repository.dart';
import '../datasources/cita_remote.dart';

class CitaRepositoryImp extends CitaRepository {
  final CitaRemoteDataSource citaRemoteDataSource;

  CitaRepositoryImp({required this.citaRemoteDataSource});
  @override
  Future<Cita?> createCita(
    String nombreD,
    String nombreP,
    String motivo,
    String status,
    String horario,
    String recomendaciones,
    String idDoctor,
    String idPaciente,
  ) async {
    return await citaRemoteDataSource.createCita(nombreD, nombreP, motivo,
        status, horario, recomendaciones, idDoctor, idPaciente);
  }

  @override
  Future<List<Cita?>> getCita(String id) async {
    return await citaRemoteDataSource.getCita(id);
  }

  @override
  Future<bool> deleteCita(String id) async {
    return await citaRemoteDataSource.deleteCita(id);
  }
}
