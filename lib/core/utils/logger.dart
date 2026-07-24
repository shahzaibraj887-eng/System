class AppLogger {
  static const String _prefix = '[SYSTEM]';

  static void info(String message) {
    print('$_prefix [INFO] $message');
  }

  static void debug(String message) {
    print('$_prefix [DEBUG] $message');
  }

  static void warning(String message) {
    print('$_prefix [WARNING] $message');
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    print('$_prefix [ERROR] $message');
    if (error != null) {
      print('Error: $error');
    }
    if (stackTrace != null) {
      print('StackTrace: $stackTrace');
    }
  }

  static void success(String message) {
    print('$_prefix [SUCCESS] $message');
  }
}
