import 'package:focusthrive/features/focusthrive/consejo/domain/entities/consejo.dart';

import '../repositories/consejo_repository.dart';

class GetConsejoUseCase {
  final ConsejoRepository consejoRepository;

  GetConsejoUseCase(this.consejoRepository);

  Future<List<Consejo?>> execute(String id) async {
    return await consejoRepository.getConsejo(id);
  }
}
