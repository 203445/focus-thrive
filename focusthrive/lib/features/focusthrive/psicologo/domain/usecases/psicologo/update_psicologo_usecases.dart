import 'dart:io';
import '../../repositories/psicologo_repository.dart';

class UpdatePsicologoUseCase {
  final PsicologoRepository psicologoRepository;

  UpdatePsicologoUseCase(this.psicologoRepository);

  Future<bool> execute(
      String id,
      String name,
      String apellido,
      String telefono,
      String correo,
      String descripcion,
      String ubicacion,
      File? urlfoto) async {
    return await psicologoRepository.updatePsicologo(
        id, name, apellido, telefono, correo, descripcion, ubicacion, urlfoto);
  }
}
