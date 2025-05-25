import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/customer_support/controllers/customer_support_controller.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../enum/message_type.dart';
import 'app_textfield_chat_widget.dart';

class InputAreaWidget extends StatelessWidget {
  const InputAreaWidget({super.key, required this.controller});

  final CustomerSupportController controller;

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      vPadding: 10,
      child: Column(
        children: [
          Obx(() {
            if (controller.isRecording.value) {
              return Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.stop, color: ColorManager.errorColor),
                    onPressed: controller.stopRecording,
                  ),
                  const  Text('جارٍ التسجيل...'),
                ],
              );
            }
            return const SizedBox.shrink();
          }),
          Row(
            children: [
              SpeedDial(
                direction: SpeedDialDirection.up,
                elevation: 0.0,
                backgroundColor: ColorManager.chatContainerColor,
                activeBackgroundColor: ColorManager.primaryColor,
                activeChild: Icon(Icons.close,color: ColorManager.whiteColor,size: 20.sp,),
                child: SvgPicture.asset(AssetsManager.chatLinkIcon),
                overlayOpacity: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                children: [
                  SpeedDialChild(
                    onTap: (){
                      controller.pickFile();
                    },
                    backgroundColor: ColorManager.chatContainerColor,
                    foregroundColor: ColorManager.transparentColor,
                    shape: CircleBorder(),
                    elevation: 0.0,
                    child: SvgPicture.asset(AssetsManager.chatDocumentIcon),
                  ), SpeedDialChild(
                    onTap: (){
                      controller.pickMedia();
                    },
                    backgroundColor: ColorManager.chatContainerColor,
                    foregroundColor: ColorManager.transparentColor,
                    shape: CircleBorder(),
                    elevation: 0.0,
                    child: SvgPicture.asset(AssetsManager.chatGalleryIcon),
                  ),SpeedDialChild(
                    onTap: (){
                      controller.startRecording();
                    },
                    backgroundColor: ColorManager.chatContainerColor,
                    foregroundColor: ColorManager.transparentColor,
                    shape: CircleBorder(),
                    elevation: 0.0,
                    child: SvgPicture.asset(AssetsManager.chatMicrophoneIcon),
                  ),

                ],
              ),
              10.w.width,
              Expanded(
                child: AppTextFieldChatWidget(
                  controller: controller.textController,
                  hintText: 'اكتب هنا...',
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (controller.textController.text.isNotEmpty) {
                        controller.sendMessage(
                          controller.textController.text,
                          MessageType.text,
                          true,
                        );
                      }
                    },
                    icon: SvgPicture.asset(
                      AssetsManager.chatArrowsSendIcon,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
