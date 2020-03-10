abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  const ServerFailure({this.message});

  final String message;

  @override
  List<Object> get props => <Object>[];
}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object> get props => <Object>[];
}

class LoginCredentialsFailure extends Failure {
  const LoginCredentialsFailure({this.message, this.errorCode});
  final int errorCode;
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

class PermissionDeniedFailure extends Failure {
  @override
  List<Object> get props => <Object>[];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({this.message});
  final String message;
  @override
  List<Object> get props => <Object>[];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => <Object>[];
}

class StoreFailure extends Failure {
  const StoreFailure({this.message});

  final String message;
  @override
  List<Object> get props => <Object>[];
}

class ResetPwdFailure extends Failure {
  const ResetPwdFailure({this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}

class InvalidOtpFailure extends Failure {
  @override
  List<Object> get props => <Object>[];
}

class GetTicketsFailure extends Failure {
  @override
  List<Object> get props => <Object>[];
}

class SessionFailure extends Failure {
  @override
  List<Object> get props => <Object>[];
}
