import 'package:flutter/cupertino.dart';
import 'package:wasla_app/core/color_manager.dart';

import '../../../../core/style_manager.dart';

class CheckOutTitleWidget extends StatelessWidget {
  const CheckOutTitleWidget({
    super.key,
    required this.title,
    required this.amount,
    this.titleColor = ColorManager.textPrimaryColor,
    this.amountColor = ColorManager.textSecondaryColor,
  });

  final String title;
  final String amount;
  final Color titleColor;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: getRegularStyle(color: titleColor, fontSize: 18),
          ),
        ),
        Text(
          amount + '\$',
          textDirection: TextDirection.ltr,
          style: getBoldStyle(
            color: amountColor,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
