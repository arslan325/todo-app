import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utills/constants/colors.dart';
import 'package:todo_app/view/components/loading_dialogue.dart';
import 'package:todo_app/view_models/todo_view_model.dart';

import 'custom_toaster.dart';

customAlertDialog({
  required BuildContext context,
  required String dialogTitle,
  required String message,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          dialogTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Buy Pro Version',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ColorsConstant.kToolingErrorColor,
                  ),
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                loadingDialogue(context);
                final provider =
                    Provider.of<TodoViewModel>(context, listen: false);
                await provider.removeTodo(provider.todos.first.id ?? '');
                Future.microtask(() {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  showSnackBar(
                      message:
                          "first item is deleted successfully, you can add one new task.",
                      context: context,
                      backGroundColor: ColorsConstant.kToolingSuccessColor);
                });
              } catch (e) {
                Future.microtask(() {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  showSnackBar(
                      message: e.toString(),
                      context: context,
                      backGroundColor: ColorsConstant.kToolingErrorColor);
                });
              }
            },
            child: Text(
              'Remove First',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      );
    },
  );
}
