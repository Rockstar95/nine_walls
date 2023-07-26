import 'package:flutter/material.dart';
import '../backend/navigation/navigation_controller.dart';
import '../utils/my_print.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPrint.printOnConsole("MyApp Build Called");

    return const MainApp();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPrint.printOnConsole("MainApp Build Called");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationController.mainScreenNavigator,
      title: "9Walls",
      theme: ThemeData.dark(),
      onGenerateRoute: NavigationController.onMainAppGeneratedRoutes,
    );
  }
}
