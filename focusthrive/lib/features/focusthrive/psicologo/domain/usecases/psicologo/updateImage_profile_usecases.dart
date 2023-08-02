import '../../repositories/psicologo_repository.dart';

class UpdatePsicologoProfileUseCase {
  final PsicologoRepository psicologoRepository;

  UpdatePsicologoProfileUseCase(this.psicologoRepository);

  Future<bool> execute(String id, String name, String apellido, String telefono,
      String correo, String descripcion, String ubicacion, String img) async {
    return await psicologoRepository.updatePsicologoProfile(
        id, name, apellido, telefono, correo, descripcion, ubicacion, img);
  }
}
