import '../../domain/repositories/respuesta_repository.dart';
import '../datasources/respuesta_remote.dart';

class RespuestaRepositoryImp extends RespuestaRepository {
  final RespuestaRemoteDataSource respuestaRemoteDataSource;

  RespuestaRepositoryImp({required this.respuestaRemoteDataSource});

  Future<bool> getRespuesta(String id) async {
    return await respuestaRemoteDataSource.getRespuesta(id);
  }
}
