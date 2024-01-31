import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/view/components/todo_card.dart';

class TodoScreen extends StatefulWidget {

   TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.secondary,
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Todos Task',style: theme.textTheme.headlineMedium,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const TodoCard();
                }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10.h,);
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
