import '../errors/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams {}
