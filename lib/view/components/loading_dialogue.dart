import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

loadingDialogue(BuildContext context) {
  final theme = Theme.of(context);
  showDialog(
    barrierDismissible: false,
    context: context,
    barrierColor: theme.colorScheme.primary,
    builder: (c) {
      return AlertDialog(
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        contentPadding: EdgeInsets.all(25.w),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: theme.colorScheme.onPrimaryContainer,
            ),
            SizedBox(
              height: 13.h,
            ),
            Text(
              "Loading...",
              style: theme.textTheme.bodyLarge,
            )
          ],
        ),
      );
    },
  );
}
