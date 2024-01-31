import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utills/constants/colors.dart';
import 'package:todo_app/view_models/todo_view_model.dart';

import 'custom_toaster.dart';
import 'loading_dialogue.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final todoProvider = Provider.of<TodoViewModel>(context, listen: false);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Checkbox(
            value: todo.isCompleted,
            checkColor: theme.colorScheme.primary,
            activeColor: Colors.white,
            onChanged: (bool? value) async{
              try{
                loadingDialogue(context);
                Map<String,dynamic> data = {
                  "isCompleted": value
                };
                await todoProvider.updateTodo(data,todo.id ?? '');
                  Future.microtask(() {
                    context.pop();
                    showSnackBar(
                        message: "status updated successfully",
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
            },
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.title ?? '',style: theme.textTheme.headlineSmall,),
              SizedBox(height: 5.h,),
              Text(todo.description ?? '',style: theme.textTheme.bodyLarge,),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: theme.colorScheme.onPrimaryContainer,))
        ],
      ),
    );
  }
}
