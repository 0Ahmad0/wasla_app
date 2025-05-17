import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/my_address/controllers/my_address_controller.dart';
import 'package:wasla_app/app/features/my_address/widgets/my_address_item_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class MyAddressView extends GetView<MyAddressController> {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: StringsManager.myAddressText,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.toNamed(AppRoutes.addNewAddress),
          icon:  Icon(
            Icons.add_location_alt,
            color: ColorManager.whiteColor,
          ),
          label: Text(
            StringsManager.addNewAddressText,
            style: getRegularStyle(
              color: ColorManager.whiteColor,
            ),
          )),
      body: Obx(()=>ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        itemBuilder: (context, index) {
          final address = controller.myAddressList.reversed.toList()[index];
          return MyAddressItemWidget(
            index: index,
            address: address,
          );
        },
        itemCount: controller.myAddressList.length,
      )),
    );
  }
}
