class AppException implements Exception {
  final String message;
  AppException(this.message);
  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([super.message = 'No internet connection.']);
}

class AuthException extends AppException {
  AuthException([super.message = 'Authentication error.']);
}

class ForbiddenException extends AppException {
  ForbiddenException([super.message = 'You don\'t have permission.']);
}

class NotFoundException extends AppException {
  NotFoundException([super.message = 'Resource not found.']);
}

class ServerException extends AppException {
  ServerException([super.message = 'Server error.']);
}

class UnknownException extends AppException {
  UnknownException([super.message = 'Unknown error occurred.']);
}
