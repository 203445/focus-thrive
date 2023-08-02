import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/consejo/domain/entities/consejo.dart';
import 'package:focusthrive/features/focusthrive/consejo/domain/usecases/get_consejo_usecases.dart';

class GetConsejoProvider extends ChangeNotifier {
  final GetConsejoUseCase getConsejoUseCase;

  GetConsejoProvider({required this.getConsejoUseCase});
  List<Consejo>? consejo;

  Future<void> getConsejo(String id) async {
    consejo = (await getConsejoUseCase.execute(id)).cast<Consejo>();
    notifyListeners();
  }
}
