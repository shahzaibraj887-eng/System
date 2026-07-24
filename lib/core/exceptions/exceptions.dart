class AppExceptions implements Exception {
  final String message;
  final String? code;
  final dynamic originalException;

  AppExceptions({
    required this.message,
    this.code,
    this.originalException,
  });

  @override
  String toString() => message;
}

class AuthException extends AppExceptions {
  AuthException({
    required String message,
    String? code,
  }) : super(message: message, code: code);
}

class FirebaseException extends AppExceptions {
  FirebaseException({
    required String message,
    String? code,
    dynamic originalException,
  }) : super(
    message: message,
    code: code,
    originalException: originalException,
  );
}

class NetworkException extends AppExceptions {
  NetworkException({
    required String message,
  }) : super(message: message);
}

class ValidationException extends AppExceptions {
  ValidationException({
    required String message,
  }) : super(message: message);
}

class NotFoundException extends AppExceptions {
  NotFoundException({
    required String message,
  }) : super(message: message);
}
