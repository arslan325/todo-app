import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/utills/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      context.go(AppRouteNames.todoScreenRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            'Todo App',
            style: Theme.of(context).textTheme.displayLarge
          ),
        ),
      ),
    );
  }
}
