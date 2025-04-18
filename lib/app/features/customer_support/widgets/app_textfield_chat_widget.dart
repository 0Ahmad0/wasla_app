import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../../core/color_manager.dart';

var _borderTextFiled =
    ({Color color = ColorManager.chatContainerColor}) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        );

class AppTextFieldChatWidget extends StatefulWidget {
  AppTextFieldChatWidget(
      {Key? key,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.iconData,
      this.hintText,
      this.obscureText = false,
      required this.suffixIcon ,
      this.validator,
      this.onChanged,
      this.onTap,
      this.autofocus = false,
      this.readOnly = false,
      this.isMultiLine = false,
      this.maxLine = 1,
      this.minLine = 1,
      // this.hintColor = ColorManager.hintTextColor,
      // this.textColor = ColorManager.blackColor,
      this.filteringTextFormatterList,
      this.iconDataImage})
      : super(key: key);

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? iconDataImage;
  final String? hintText;

  final Widget suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  bool isMultiLine;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxLine;
  final int? minLine;
  final List<FilteringTextInputFormatter>? filteringTextFormatterList;

  @override
  State<AppTextFieldChatWidget> createState() => _AppTextFieldChatWidgetState();
}

class _AppTextFieldChatWidgetState extends State<AppTextFieldChatWidget> {
  void showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: getRegularStyle(color: ColorManager.blackColor, fontSize: 18),
      focusNode: _focusNode,
      onTapOutside: (v) {
        _focusNode.unfocus();
      },
      inputFormatters: widget.filteringTextFormatterList,
      maxLines: widget.maxLine,
      minLines: widget.minLine,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      cursorColor: ColorManager.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w,),
        filled: true,
        fillColor: ColorManager.chatContainerColor,
        border: _borderTextFiled(),
        hintText: widget.hintText,
        hintStyle:
            getRegularStyle(color: ColorManager.hintTextColor, fontSize: 18),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
