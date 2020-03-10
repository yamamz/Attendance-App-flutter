class ServerException implements Exception {
  ServerException({this.message});
  final String message;
}

class NoInternetConnectionException implements Exception {}

class LoginCredentialsException implements Exception {
  LoginCredentialsException({this.message, this.errorCode});
  final int errorCode;
  final String message;
}

class PermissionDeniedException implements Exception {}

class BadRequestException implements Exception {
  BadRequestException({this.message});
  final String message;
}

class ResetPasswordException implements Exception {
  ResetPasswordException({this.message});

  final String message;
}

class SessionException implements Exception {
  SessionException();
}

class CacheException implements Exception {}

class StoreException implements Exception {
  StoreException({this.message});

  final String message;
}

class InvalidOtpException implements Exception {}

class GetTicketsException implements Exception {}
