import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';
import 'package:timeline_tile/timeline_tile.dart';
class OrderTrackingStatusWidget extends StatelessWidget {
  const OrderTrackingStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.notificationDateTimeGrayColor,
          width: .5
        ),
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          8.h.height,
          Text(
            'شكرًا لطلبك🫶',
            textAlign: TextAlign.center,
            style: getBoldStyle(color: ColorManager.primaryColor),
          ),
         2.h.height,
          AppPadding(
            vPadding: 0,
            child: Text(
              'يمكنك متابعة حالة طلبك بسهولة عبر الضغط على الزر أدناه للاطلاع على آخر التحديثات😎',
              textAlign: TextAlign.center,
              style: getLightStyle(
                color: ColorManager.textSecondaryColor,
              ),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: ColorManager.transparentColor
            ),
            child: ExpansionTile(
              title: Text("تتبع الطلب"),
              children: [
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    color: Colors.orange,
                    iconStyle: IconStyle(
                      iconData: Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('تم قبول الطلب',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('نقوم الآن بتجهيز الطلب لتحديد وقت الاستلام.'),
                      ],
                    ),
                  ),
                ),

                // الخطوة 2
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.9,
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    color: Colors.orange,
                    iconStyle: IconStyle(
                      iconData: Icons.local_shipping,
                      color: Colors.white,
                    ),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('جارٍ تجهيز الطلب بواسطة السائق',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('بدأنا تجهيز طلبك. سيتم استلامه من قِبل السائق قريبًا.'),
                      ],
                    ),
                  ),
                ),

                // الخطوة 3
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isLast: true,
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    color: Colors.orange,
                    iconStyle: IconStyle(
                      iconData: Icons.delivery_dining,
                      color: Colors.white,
                    ),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('جاهز للتوصيل',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('السائق في طريقه لتسليم طلبك.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
