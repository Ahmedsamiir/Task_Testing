import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:task_testing/app.dart';
import 'package:task_testing/core/repository/authentication_repository/authentication_repository.dart';
import 'package:task_testing/firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Show Splash Screen till data loads & when loaded call FlutterNativeSplash.remove();
  /// In this case I'm removing it inside AuthenticationRepository() -> onReady() method.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Before running App - Initialize Firebase and after initialization, Call
  /// Authentication Repository so that It can check which screen to show.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}
