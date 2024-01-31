import 'package:go_router/go_router.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utills/routes/route_names.dart';
import 'package:todo_app/view/add_todo_screen.dart';
import 'package:todo_app/view/splash_screen.dart';
import 'package:todo_app/view/todo_screen.dart';
import 'package:todo_app/view/update_todo_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: AppRouteNames.initialRoute,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppRouteNames.todoScreenRoute,
    builder: (context, state) => const TodoScreen(),
  ),
  GoRoute(
    path: AppRouteNames.addTodoScreenRoute,
    builder: (context, state) => const AddTodoScreen(),
  ),
  GoRoute(
    path: AppRouteNames.updateTodoScreenRoute,
    builder: (context, state) {
      Todo todo = state.extra as Todo;
      return UpdateTodoScreen(
        todo: todo,
      );
    },
  ),
]);
