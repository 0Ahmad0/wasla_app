import 'package:url_launcher/url_launcher.dart';

class LauncherHelper {
  static Future<void> launchWebUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'تعذر فتح الرابط: $url';
    }
  }

  static Future<void> launchEmail({
    required String toEmail,
    String subject = '',
    String body = '',
  }) async {
    final Uri emailLaunchUri = Uri.parse(
      'mailto:$toEmail?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    if (!await launchUrl(emailLaunchUri)) {
      throw 'تعذر فتح تطبيق البريد الإلكتروني';
    }
  }

}
