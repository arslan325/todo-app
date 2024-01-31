import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            value: true,
            checkColor: theme.colorScheme.primary,
            activeColor: Colors.white,
            onChanged: (bool? value) {

            },
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Todos Tasks',style: theme.textTheme.headlineSmall,),
              SizedBox(height: 5.h,),
              Text('Todos description',style: theme.textTheme.bodyLarge,),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: theme.colorScheme.onPrimaryContainer,))
        ],
      ),
    );
  }
}
