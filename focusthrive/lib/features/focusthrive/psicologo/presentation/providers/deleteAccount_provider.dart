import 'package:flutter/foundation.dart';
import 'package:focusthrive/features/focusthrive/psicologo/domain/usecases/psicologo/delete_psicologo_usecases.dart';

class DeleteAccountPsicologoProvider extends ChangeNotifier {
  final DeletePsicologoUseCase deletePsicologoAccountUseCase;
  DeleteAccountPsicologoProvider({required this.deletePsicologoAccountUseCase});
  bool response = false;

  Future<void> deleteAccountPsicologo(String id) async {
    response = await deletePsicologoAccountUseCase.execute(id);
    if (response == true) {
      notifyListeners();
    } else {
      notifyListeners();
      print('No se puede actualizar');
    }
  }
}
