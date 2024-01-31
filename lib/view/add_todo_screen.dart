import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/view/components/custom_button.dart';
import 'package:todo_app/view/components/custom_text_field.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task',style: theme.textTheme.headlineMedium,),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Form(
             key: _formKey,
             child: Column(
             children: [
               CustomTextField(controller: _titleController, hintText: "Enter task title"),
               SizedBox(height: 20.h,),
               CustomTextField(controller: _descriptionController, hintText: "Enter task description"),
             ],
           ),),
            SizedBox(height: 40.h,),
            CustomButton(onTap: (){}, buttonText: "Add"),
        ],),
      ),
    );
  }
}
