import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_testing/core/utils/app_bindings.dart';
import 'package:task_testing/core/utils/theme/theme.dart';
import 'package:task_testing/feature/splash_screen/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(), // Solves the issues of Get.lazyPut and Get.Put() by defining all Controllers in single class
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const Scaffold(body: Center(child: CircularProgressIndicator())),
      //home: const SplashScreen(),
      /// Show Progress Indicator OR SPLASH SCREEN until Screen Loads all its data from cloud.
      /// Let the AuthenticationRepository decide which screen to appear as first.
    );
  }
}
