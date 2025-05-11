import 'package:flutter/material.dart';

class ShowAndAddYourProductRateWidget extends StatelessWidget {
  const ShowAndAddYourProductRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      expand: false,

      builder: (context, scrollController) {
        return ListView(
          controller: scrollController,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "This is a custom bottom sheet with drag control!",
                style: TextStyle(fontSize: 18),
              ),
            ),
            // أضف محتوى إضافي هنا
          ],
        );
      },
    );
  }
}
