import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wasla_app/core/assets_manager.dart';

import '../color_manager.dart';

class ShareHelper {
  static Future<void> shareAppWithImage(
      {String url = AssetsManager.appIcon}) async {
    const appLink = "https://wasla_app.com";
    String appImage = url;
    const shareText = "حمّل تطبيق وصلة الآن للتسوق من شي إن 🛍️\n$appLink";

    try {
      final byteData = await rootBundle.load(appImage);

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
      await SharePlus.instance.share(params);
    } catch (e) {
      print("خطأ أثناء المشاركة: $e");
    }
  }



  static Future<void> shareImageFromUrl({
    String? imageUrl,
    String url = 'https://wasla_app.com',
    String? shareText,
  }) async {
    final appLink = url;
    shareText = (shareText ?? '') + "\n$appLink";

    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator(
          color: ColorManager.primaryColor,
        ),),
        barrierDismissible: false,
      );

      Uint8List imageBytes;

      if (imageUrl != null && imageUrl.startsWith('http')) {
        final response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          imageBytes = response.bodyBytes;
        } else {
          throw Exception("فشل تحميل الصورة من الإنترنت");
        }
      } else {
        final byteData =
        await rootBundle.load(imageUrl ?? AssetsManager.appIcon);
        imageBytes = byteData.buffer.asUint8List();
      }

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/share_image.png');
      await file.writeAsBytes(imageBytes);

      final params = ShareParams(
        files: [XFile(file.path)],
        fileNameOverrides: ['share.png'],
        text: shareText,
      );

      // إغلاق التحميل قبل المشاركة
      Get.back();

      await SharePlus.instance.share(params);
    } catch (e) {
      Get.back(); // إغلاق التحميل حتى لو حصل خطأ
      print("خطأ أثناء المشاركة: $e");
      Get.snackbar("خطأ", "حدث خطأ أثناء المشاركة");
    }
  }

}
