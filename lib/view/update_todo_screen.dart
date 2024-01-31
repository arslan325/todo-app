import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utills/constants/colors.dart';
import 'package:todo_app/view/components/custom_button.dart';
import 'package:todo_app/view/components/custom_text_field.dart';
import 'package:todo_app/view/components/custom_toaster.dart';
import 'package:todo_app/view/components/loading_dialogue.dart';
import 'package:todo_app/view_models/todo_view_model.dart';

class UpdateTodoScreen extends StatefulWidget {
  final Todo todo;
  const UpdateTodoScreen({super.key, required this.todo});
  @override
  State<UpdateTodoScreen> createState() => _UpdateTodoScreenState();
}

class _UpdateTodoScreenState extends State<UpdateTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _titleController.text = widget.todo.title ?? '';
    _descriptionController.text = widget.todo.description ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final todosProvider = Provider.of<TodoViewModel>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Update Task',
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
                    try{
                      loadingDialogue(context);
                      Map<String,dynamic> data = {
                        "title": _titleController.text,
                        "description": _descriptionController.text
                      };
                      await todosProvider.updateTodo(data,widget.todo.id ?? '');
                      Future.microtask(() {
                        context.pop();
                        context.pop();
                        showSnackBar(
                            message: "data updated successfully",
                            context: context,
                            backGroundColor: ColorsConstant.kToolingSuccessColor);
                      });
                    }
                    catch(e){
                      Future.microtask(() {
                        context.pop();
                        showSnackBar(
                            message: e.toString(),
                            context: context,
                            backGroundColor: ColorsConstant.kToolingErrorColor);
                      });
                    }
                  }
                },
                buttonText: "Update"),
          ],
        ),
      ),
    );
  }
}
