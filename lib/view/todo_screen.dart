import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utills/constants/colors.dart';
import 'package:todo_app/utills/routes/route_names.dart';
import 'package:todo_app/view/components/todo_card.dart';
import 'package:todo_app/view_models/todo_view_model.dart';

import 'components/custom_toaster.dart';
import 'components/loading_dialogue.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late Future<void> todosFuture;
  @override
  void initState() {
    todosFuture =
        Provider.of<TodoViewModel>(context, listen: false).loadTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final todoModel = Provider.of<TodoViewModel>(context, listen: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.secondary,
        onPressed: () {
          context.push(AppRouteNames.addTodoScreenRoute);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'Todos Task',
          style: theme.textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  loadingDialogue(context);
                  await todoModel.loadTodos();
                  if (mounted) {
                    context.pop();
                    showSnackBar(
                        message: "data fetched successfully",
                        context: context,
                        backGroundColor: ColorsConstant.kToolingSuccessColor);
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
              },
              icon: Icon(
                Icons.refresh,
                color: theme.colorScheme.onPrimaryContainer,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: FutureBuilder(
                future: todosFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(color: theme.colorScheme.onPrimaryContainer,),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: theme.textTheme.bodyLarge,
                      ),
                    );
                  }
                  return todoModel.todos.isNotEmpty
                      ? ListView.separated(
                          itemCount: todoModel.todos.length,
                          itemBuilder: (context, index) {
                            return TodoCard(
                              todo: todoModel.todos[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "No todos data found",
                            style: theme.textTheme.bodyLarge,
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
