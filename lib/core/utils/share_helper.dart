import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wasla_app/core/assets_manager.dart';

class ShareHelper {
  static Future<void> shareAppWithImage(
      {String url = AssetsManager.appIcon}) async {
    const appLink = "https://wasla_app.com";
    String appImage = url;
    const shareText = "حمّل تطبيق وصلة الآن للتسوق من شي إن 🛍️\n$appLink";

    try {
      // تحميل الصورة من الأصول
      final byteData = await rootBundle.load(appImage);

      // حفظها مؤقتًا في ملف
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/share_image.png');
      await file.writeAsBytes(byteData.buffer.asUint8List());
      final params = ShareParams(
        files: [
          XFile(file.path),
        ],
        fileNameOverrides: ['share.png'],
        text: shareText,
      );
      // مشاركة الصورة والنص
      await SharePlus.instance.share(params);
    } catch (e) {
      print("خطأ أثناء المشاركة: $e");
    }
  }
}
