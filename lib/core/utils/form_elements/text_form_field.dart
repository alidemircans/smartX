import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartx/core/constants/colors_constants%20copy.dart';
import 'package:smartx/core/utils/text/text_generator_widget.dart';

class TextFormFieldWidget extends StatelessWidget {
  Iterable<String>? autofillHints;
  TextEditingController? controller;
  FocusNode? focusNode;
  bool obscureText;
  Widget? suffixIcon;
  String? title;
  TextInputType? textInputType;
  String? hintText;
  Color backColor;
  void Function()? onEditingComplete;

  TextFormFieldWidget({
    required this.title,
    this.obscureText = false,
    this.autofillHints,
    this.controller,
    this.focusNode,
    this.suffixIcon = const SizedBox(),
    this.textInputType,
    this.hintText,
    this.backColor = AppColors.lightGreyBackGroundColor,
    this.onEditingComplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != "")
          Padding(
            padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
            child: TextStyleGenerator(
              text: title,
              fontSize: 12.sp,
              color: AppColors.subTitleTextColor,
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                1000,
              ),
            ),
            border: Border.all(
              color: AppColors.textFormFieldBorderGrey,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            onEditingComplete: onEditingComplete,
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            focusNode: focusNode,
            style: const TextStyle(
              color: Color.fromARGB(255, 66, 53, 53),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.black,
                fontSize: 12.sp,
              ),
            ),
            textAlign: TextAlign.left,
            autofillHints: const [AutofillHints.email],
          ),
        ),
      ],
    );
  }
}
