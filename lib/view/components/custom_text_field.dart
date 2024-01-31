import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String? value)? validator;
  final String hintText;
  const CustomTextField({super.key, required this.controller, this.validator, required this.hintText});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      cursorColor: theme.colorScheme.onSurface,
      controller: controller,
      style: theme.textTheme.labelLarge,
      validator:validator != null ? (value) => validator!(value):null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 28.w),
        hintText: hintText,
        filled: true,
        fillColor: theme.colorScheme.primaryContainer,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: theme.colorScheme.primaryContainer,
          ),
        ),
        hintStyle: theme.textTheme.labelLarge,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
