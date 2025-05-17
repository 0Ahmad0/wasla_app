import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/strings_manager.dart';

var _borderTextFiled = ({Color color = ColorManager.primaryColor}) =>
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: color, width: 1.sp));

class AppSearchTextField extends StatefulWidget {
  const AppSearchTextField({
    super.key,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.iconData,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.autofocus = false,
    this.readOnly = false,
    this.filteringTextFormatterList,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? hintText;
  final Widget? prefixIcon;

  final Widget? suffixIcon;
  final bool autofocus;
  final bool readOnly;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final List<FilteringTextInputFormatter>? filteringTextFormatterList;

  @override
  State<AppSearchTextField> createState() => _AppSearchTextFieldState();
}

class _AppSearchTextFieldState extends State<AppSearchTextField> {
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
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      cursorColor: ColorManager.primaryColor,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
          filled: true,
          fillColor: ColorManager.secondaryColor.withOpacity(.1),
          focusedBorder: _borderTextFiled(color: ColorManager.primaryColor),
          border: _borderTextFiled(color: Colors.transparent),
          enabledBorder: _borderTextFiled(color: Colors.transparent),
          errorBorder: _borderTextFiled(color: ColorManager.errorColor),
          focusedErrorBorder: _borderTextFiled(color: ColorManager.errorColor),
          hintText: widget.hintText,
          hintStyle:
              getRegularStyle(color: ColorManager.hintTextColor, fontSize: 18),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon),
    );
  }
}
