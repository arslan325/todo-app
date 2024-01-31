import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  const CustomButton({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: MaterialButton(
        color: theme.colorScheme.secondary,
        onPressed: onTap,
        child: Text(buttonText,style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16.sp),),),
    );
  }
}
