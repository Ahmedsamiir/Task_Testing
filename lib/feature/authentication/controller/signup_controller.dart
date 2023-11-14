import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_testing/core/repository/authentication_repository/authentication_repository.dart';
import 'package:task_testing/core/repository/user_repository/user_repository.dart';
import 'package:task_testing/feature/authentication/models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final userRepo = UserRepository.instance;

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final TextEditingController fullName = TextEditingController();

  /// Loader
  final isLoading = false.obs;

  // As in the AuthenticationRepository we are calling _setScreen() Method
  // so, whenever there is change in the user state(), screen will be updated.
  // Therefore, when new user is authenticated, AuthenticationRepository() detects
  // the change and call _setScreen() to switch screens

  /// Register New User using either [EmailAndPassword] OR [PhoneNumber] authentication
  Future<void> createUser(UserModel user) async {
    try {
      isLoading.value = true;
      await emailAuthentication(user.email, user.password); //Perform authentication
      await userRepo.createUser(user); //Store Data in FireStore
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
    }
  }

  /// [EmailAuthentication]
  Future<void> emailAuthentication(String email, String password) async {
    try {
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    } catch (e) {
      throw e.toString();
    }
  }
//
// /// [PhoneNoAuthentication]
// Future<void> phoneAuthentication(String phoneNo) async {
//   try {
//     await AuthenticationRepository.instance.phoneAuthentication(phoneNo);
//   } catch (e) {
//     throw e.toString();
//   }
// }

// /// [GoogleSignInAuthentication]
// Future<void> googleSignIn() async {
//   try {
//     isLoading.value = true;
//     await AuthenticationRepository.instance.signInWithGoogle();
//   } catch (e) {
//     isLoading.value = false;
//     Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
//   }
// }
}
