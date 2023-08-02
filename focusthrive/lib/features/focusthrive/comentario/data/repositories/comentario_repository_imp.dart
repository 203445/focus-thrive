import 'package:focusthrive/features/focusthrive/comentario/domain/entities/comentario.dart';

import '../../domain/repositories/comentario_repository.dart';
import 'package:focusthrive/features/focusthrive/comentario/data/datasources/comentario_remote.dart';

class ComentarioRepositoryImp implements ComentarioRepository {
  final ComentarioRemoteDataSource comentarioRemoteDataSource;

  ComentarioRepositoryImp({required this.comentarioRemoteDataSource});

  @override
  Future<Comentario?> createComentario(
      String idP, String idDoc, String descripcion) async {
    return await comentarioRemoteDataSource.createComentario(
        idP, idDoc, descripcion);
  }

  @override
  Future<List<Comentario?>> listComentario(String idDoc) async {
    return await comentarioRemoteDataSource.listComentario(idDoc);
  }
}
