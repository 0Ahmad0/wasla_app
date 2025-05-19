import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wasla_app/app/features/my_address/controllers/my_address_controller.dart';
import 'package:wasla_app/app/features/my_address/views/location_picker_view.dart';
import 'package:wasla_app/app/features/my_address/widgets/location_dialog_picker_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../widgets/app_textfield_widget.dart';
import '../model/my_address_model.dart';

class AddNewAddressView extends GetView<MyAddressController> {
  const AddNewAddressView({super.key});

  void _showMapDialog() {
    Get.dialog(
      useSafeArea: false,
      barrierDismissible: false,
      LocationDialogPickerWidget(),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: StringsManager.addNewAddressText,
      ),
      body: SingleChildScrollView(
        child: AppPadding(
          vPadding: 10,
          child: Form(
            key: controller.addNewLocationFormKey,
            child: Column(
              children: [
                AppTextField(
                  controller: controller.locationTextController,
                  readOnly: true,
                  onTap: () => Get.to(()=> LocationPickerPage()),
                  hintText: 'اختيار الموقع من الخريطة',
                ),
                8.h.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: AppTextField(
                        controller: controller.cityController,
                        hintText: 'المدينة',
                      ),
                    ),
                    8.w.width,
                    Flexible(
                      child: AppTextField(
                        controller: controller.buildingController,
                        hintText: 'رقم المبنى',
                        keyboardType: TextInputType.number,
                        validator: (value){},

                      ),
                    ),
                  ],
                ),
                8.h.height,
                AppTextField(
                  controller: controller.titleController,
                  hintText: 'وصف الموقع بيت,شركة,مكتب,...إلخ',
                ),
                8.h.height,
                AppTextField(
                  controller: controller.districtController,
                  hintText: 'الحي',
                ),

                8.h.height,
                // AppTextField(
                //   controller: controller.subtitleController,
                //   hintText: 'وصف الموقع',
                // ),
                // 8.h.height,

                AppTextField(
                  controller: controller.streetController,
                  hintText: 'اسم الشارع',
                  validator: (value){},

                ),

                8.h.height,

                AppTextField(
                  controller: controller.landmarkController,
                  hintText: 'معلم بارز',
                  validator: (value){},
                ),
                8.h.height,
                AppTextField(
                  controller: controller.extraDetailsController,
                  hintText: 'تفاصيل إضافية',
                  minLine: 3,
                  maxLine: 6,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  validator: (value){},
                ),
                8.h.height,
                AppButtonWidget(
                  text: 'إضافة العنوان',
                  onPressed: () {
                    if (controller.addNewLocationFormKey.currentState!
                        .validate()) {
                      final newAddress = MyAddressModel(
                        title: controller.titleController.text+controller.locationTextController.text,
                        subtitle: controller.subtitleController.text,
                        latitude:
                            controller.selectedLocation.value?.latitude ?? 0.0,
                        longitude:
                            controller.selectedLocation.value?.longitude ?? 0.0,
                        streetName: controller.streetController.text,
                        buildingNumber: controller.buildingController.text,
                        district: controller.districtController.text,
                        city: controller.cityController.text,
                        landmark: controller.landmarkController.text,
                        extraDetails: controller.extraDetailsController.text,
                        dateSelected: DateFormat('yyyy-MM-dd HH:mm:ss')
                            .format(DateTime.now()),
                      );
                      controller.addAddress(newAddress);
                      Get.back();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
