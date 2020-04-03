// Dart logging has limit, here is a work around
class LogUtils {
  static const LOG_LEVEL = true;

  static void d(String message) {
    if (LOG_LEVEL) {
      final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern.allMatches(message).forEach((match) => print(match.group(0)));
    }
  }

  static void e(String message) {
    if (LOG_LEVEL) print("ERROR: $message");
  }

  static void i(String message) {
    if (LOG_LEVEL) print("INFO: $message");
  }
}
