import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/customer_support/controllers/customer_support_controller.dart';
import 'package:wasla_app/app/features/customer_support/widgets/container_message_widget.dart';
import 'package:wasla_app/app/features/customer_support/widgets/input_area_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/backbutton_widget.dart';
import 'package:wasla_app/core/strings_manager.dart';

class CustomerSupportView extends GetView<CustomerSupportController> {
  const CustomerSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>CustomerSupportController());
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.customerSupportText,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 10.h
              ),
              reverse: true,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                return ContainerMessageWidget(message: controller.messages[index],);
              },
            )),
          ),
          InputAreaWidget(controller: controller,),
        ],
      ),
    );
  }
}
