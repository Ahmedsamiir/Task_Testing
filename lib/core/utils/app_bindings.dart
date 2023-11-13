import 'package:get/get.dart';
import '../../feature/authentication/controller/login_controller.dart';
import '../../feature/authentication/controller/on_boarding_controller.dart';
import '../../feature/authentication/controller/signup_controller.dart';
import '../repository/authentication_repository/authentication_repository.dart';
import '../repository/user_repository/user_repository.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);

    Get.lazyPut(() => OnBoardingController(), fenix: true);

    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
  }

}