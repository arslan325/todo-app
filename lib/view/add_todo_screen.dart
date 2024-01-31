import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utills/constants/colors.dart';
import 'package:todo_app/view/components/custom_alert_box.dart';
import 'package:todo_app/view/components/custom_button.dart';
import 'package:todo_app/view/components/custom_text_field.dart';
import 'package:todo_app/view/components/custom_toaster.dart';
import 'package:todo_app/view/components/loading_dialogue.dart';
import 'package:todo_app/view_models/todo_view_model.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});
  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final todosProvider = Provider.of<TodoViewModel>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _titleController,
                    hintText: "Enter task title",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    controller: _descriptionController,
                    hintText: "Enter task description",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
                onTap: () async {
                  if(_formKey.currentState!.validate()){
                    try {
                      loadingDialogue(context);
                      bool isLimitFull = await todosProvider.addTodo(
                          _titleController.text, _descriptionController.text);
                      if(isLimitFull){
                        if (mounted) {
                          context.pop();
                          context.pop();
                          showSnackBar(
                              message: "data added successfully",
                              context: context,
                              backGroundColor: ColorsConstant.kToolingSuccessColor);
                        }
                      }
                      else{
                        if (mounted) {
                          context.pop();
                          customAlertDialog(
                              context: context,
                              dialogTitle: "Todos Limit is full",
                              message: "You need to delete one item from todos list to add new one", );
                        }
                      }
                    } catch (e) {
                      if (mounted) {
                        context.pop();
                        showSnackBar(
                            message: e.toString(),
                            context: context,
                            backGroundColor: ColorsConstant.kToolingErrorColor);
                      }
                    }
                  }
                },
                buttonText: "Add"),
          ],
        ),
      ),
    );
  }
}
