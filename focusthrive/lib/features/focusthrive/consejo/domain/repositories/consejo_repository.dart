import '../entities/consejo.dart';

abstract class ConsejoRepository {
  Future<List<Consejo?>> getConsejo(String id);
  
}
