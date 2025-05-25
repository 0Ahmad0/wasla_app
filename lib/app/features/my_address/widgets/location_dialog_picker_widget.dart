import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/style_manager.dart';
import '../controllers/my_address_controller.dart';

class LocationDialogPickerWidget extends GetView<MyAddressController> {
  const LocationDialogPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: false,

        child: FlutterMap(
          options: MapOptions(
            backgroundColor: ColorManager.chatContainerColor,
            initialCenter: controller.selectedLocation.value!,
            initialZoom: 16.0,
            onTap: (_, latLng) => controller.updateLocation(latLng),

          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.wasla.wasla_app',
            ),
            if (controller.selectedLocation.value != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: controller.selectedLocation.value!,
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.location_on,
                        color: Colors.red, size: 40),
                  ),
                ],
              ),
            Material(
                color: ColorManager.transparentColor,
                child: Column(
                  children: [
                    const AppBarWidget(title: 'حدد العنوان من الخريطة'),
                    4.h.height,
                    Visibility(
                      visible: controller.locationName.value != null,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: Get.width / 1.15),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                            color: ColorManager.whiteColor,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Text(
                          controller.locationName.value,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: AppPadding(
                vPadding: 10,
                child: AppButtonWidget(
                  text: 'تحديد',
                  onPressed: () => Get.back(),
                ),
              ),
            )
          ],
        ),



      ),
    );
  }
}
