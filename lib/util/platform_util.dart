import 'dart:io';
export 'dart:io';

class PlatformUtil {
  static Future<String> getAppVersion() async {
    String version = await Future.delayed(Duration(milliseconds: 500),() {
      return "1.0";
    });
    return version;
  }
}
