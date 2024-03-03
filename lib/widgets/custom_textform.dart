import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.inputType,
      this.textStyle,
      this.maxLength,
      required this.hintText,
      this.prefixIcon,
      this.borderRadius,
      this.controller,
      this.validator,
      this.onchanged,
      this.readonly,
      this.borderColor,
      this.suffixIcon,
      this.maxLines,
      this.contentPadding,
      this.initialValue});

  final TextInputType? inputType;
  final TextStyle? textStyle;
  final int? maxLength;
  final int? maxLines;
  final bool? readonly;
  final String hintText;
  final String? initialValue;
  final Icon? prefixIcon;
  final Color? borderColor;
  final double? borderRadius;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType ?? TextInputType.text,
      style: textStyle ?? const TextStyle(color: Colors.black54),
      maxLength: maxLength,
      maxLines: maxLines,
      readOnly: false,
      decoration: InputDecoration(
        contentPadding: prefixIcon == null
            ? contentPadding ??
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10)
            : EdgeInsets.zero,
        hintStyle: textStyle ?? const TextStyle(color: Colors.black54),
        hintText: hintText,
        counterText: '',
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: BorderSide(color: borderColor ?? Colors.black54)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: BorderSide(color: borderColor ?? Colors.deepPurple)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: const BorderSide(color: Colors.red)),
      ),
      validator: validator,
      controller: controller,
      onChanged: onchanged,
      textInputAction: TextInputAction.next,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
