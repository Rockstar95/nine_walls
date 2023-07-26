import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nine_walls/utils/extensions.dart';
import 'package:nine_walls/views/home/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData themeData;

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 5));

    if (context.checkMounted() && context.mounted) Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    return Container(
      color: themeData.colorScheme.background,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox.square(
                    dimension: context.sizeData.width * 0.7,
                    child: Image.asset(
                      "assets/images/logo.png",
                      // width: 120,
                      // height: 120,
                    ),
                  ),
                ),
              ),
              Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: themeData.colorScheme.onPrimary,
                  size: 40,
                ),
                /*child: LoadingAnimationWidget.inkDrop(
                  color: themeData.colorScheme.onPrimary,
                  size: 40,
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}
