import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:task_testing/app.dart';
import 'package:task_testing/core/repository/authentication_repository/authentication_repository.dart';
import 'package:task_testing/feature/link_screen/controllers/dynamic_link_controller.dart';
import 'package:task_testing/firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  DynamicLinkController().initDynamicLinks();
  DynamicLinkController().initUniLinks();
  runApp(const MyApp());
}
