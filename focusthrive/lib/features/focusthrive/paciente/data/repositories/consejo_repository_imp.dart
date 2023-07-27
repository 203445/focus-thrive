import 'package:focusthrive/features/focusthrive/paciente/data/datasources/consejo_remote.dart';
import 'package:focusthrive/features/focusthrive/paciente/domain/entities/consejo.dart';

import '../../domain/repositories/consejo_repository.dart';

class ConsejoRepositoryImp implements ConsejoRepository {
  final ConsejoRemoteDataSource consejoRemoteDataSource;

  ConsejoRepositoryImp({required this.consejoRemoteDataSource});

  @override
  Future<List<Consejo?>> getConsejo(String id) async {
    return await consejoRemoteDataSource.getConsejo(id);
  }
}
