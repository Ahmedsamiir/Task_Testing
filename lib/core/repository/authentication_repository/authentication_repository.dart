import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:task_testing/feature/home_screen/presentation/screens/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:task_testing/feature/welcome/welcome_screen.dart';


import 'exceptions/t_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  //late final GoogleSignInAccount googleUser;
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  var verificationId = ''.obs;

  /// QUICK links to get frequently used values in other classes.
  User? get firebaseUser => _firebaseUser.value;

  String get getUserID => _firebaseUser.value?.uid ?? "";

  String get getUserEmail => _firebaseUser.value?.email ?? "";
  String get getUserName => _firebaseUser.value?.displayName ?? "";

  //String get getUserPhoneNo => _firebaseUser.value?.phoneNumber ?? "";

  /// When App launch, this func called.
  /// It set the firebaseUser state & remove the Splash Screen
  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    FlutterNativeSplash.remove();
    ever(_firebaseUser, _setInitialScreen);
  }

  /// Setting initial screen onLOAD (optional)
  _setInitialScreen(User? user) async {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
    // : await UserRepository.instance.recordExist(user.email ?? "")
        : Get.offAll(() => const HomeScreen());
    // : Get.offAll(() => const WelcomeScreen());
  }

  // /// [GoogleAuthentication]
  // Future<UserCredential> signInWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     googleUser = (await GoogleSignIn().signIn())!;
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //
  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = TExceptions.fromCode(e.code);
  //     throw ex.message;
  //   } catch (e) {
  //     throw e.toString().isEmpty ? 'Unknown Error Occurred. Try again!' : e.toString();
  //   }
  // }

  // ///[FacebookAuthentication]
  // Future<UserCredential> signInWithFacebook() async {
  //   try {
  //     // Trigger the sign-in flow
  //     final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email']);
  //
  //     // Create a credential from the access token
  //     final AccessToken accessToken = loginResult.accessToken!;
  //     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
  //
  //     // Once signed in, return the UserCredential
  //     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = TExceptions.fromCode(e.code);
  //     throw ex.message;
  //   } catch (e) {
  //     throw e.toString().isEmpty ? 'Unknown Error Occurred. Try again!' : e.toString();
  //   }
  // }

  // /// [PhoneAuthentication] - LOGIN
  // loginWithPhoneNo(String phoneNumber) async {
  //   try {
  //     await _auth.signInWithPhoneNumber(phoneNumber);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'invalid-phone-number') {
  //       Get.snackbar("Error", "Invalid Phone No");
  //     }
  //   } catch (_) {
  //     Get.snackbar("Error", "Something went wrong.");
  //   }
  // }

  // /// [PhoneAuthentication] - REGISTER
  // Future<void> phoneAuthentication(String phoneNo) async {
  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: phoneNo,
  //       verificationCompleted: (credential) async {
  //         await _auth.signInWithCredential(credential);
  //       },
  //       codeSent: (verificationId, resendToken) {
  //         this.verificationId.value = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) {
  //         this.verificationId.value = verificationId;
  //       },
  //       verificationFailed: (e) {
  //         if (e.code == 'invalid-phone-number') {
  //           Get.snackbar('Error', 'The provided phone number is not valid.');
  //         } else {
  //           Get.snackbar('Error', 'Something went wrong. Try again.');
  //         }
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     final result = TExceptions.fromCode(e.code);
  //     throw result.message;
  //   } catch (_) {
  //     const result = TExceptions();
  //     throw result.message;
  //   }
  // }

  // /// [PhoneAuthentication] - VERIFY PHONE NO BY OTP
  // Future<bool> verifyOTP(String otp) async {
  //   var credentials = await _auth
  //       .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
  //   return credentials.user != null ? true : false;
  // }

  /// [EmailAuthentication] - LOGIN
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //firebaseUser != null ? Get.offAll(() => const HomeScreen()) : Get.to(() => const WelcomeScreen());

    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code); // Thro
      print("login result ==> $result");
      // w custom [message] variable
      throw result.message;
    } catch (_) {
      const result = TExceptions();
      throw result.message;
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser != null ? Get.offAll(() => const HomeScreen()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      throw ex.message;
    }
  }

  /// LOGOUT USER - Valid for GOOGLE, Facebook, Phone No, & other authentications.
  Future<void> logout() async {
    //await GoogleSignIn().disconnect();
    await _auth.signOut();
  }
}


// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//
//   // --- Variables
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   late final Rx<User?> _firebaseUser;
//
//   User? get firebaseUser => _firebaseUser.value;
//
//   //---- It will be load when app launches this function will be called and set the firebaseUser state
//   @override
//   void onReady() {
//     //Future.delayed(const Duration(seconds: 5));
//     _firebaseUser = Rx<User?>(_auth.currentUser);
//
//     //---- our user would be notified
//     _firebaseUser.bindStream(_auth.userChanges());
//
//     setInitialScreen(_firebaseUser.value);
//
//     //----- (listener , callback function)
//     //ever(user, _setInitialScreen);
//   }
//
//   // --- Setting initial Screen onLoad
//   setInitialScreen(User? user) async{
//       user == null ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const HomeScreen());
//     // if (user == null) {
//     //   print("Login Page");
//     //   Get.offAll(() => const LoginScreen());
//     // } else {
//     //   print("Home Page");
//     //   Get.offAll(() => const HomeScreen());
//     // }
//   }
//
//   Future<void> createUserWithEmailAndPassword(String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       _firebaseUser.value != null ? Get.offAll(() => const HomeScreen()) : Get.to(() => const LoginScreen());
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
//       Get.snackbar("ERROR", " ${e.code}");
//
//       print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//     } catch (m) {
//       const ex = SignUpWithEmailAndPasswordFailure();
//
//       print('EXCEPTION - ${ex.message}');
//       throw ex;
//     }
//   }
//
//   Future<void> loginWithEmailAndPassword(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//     } catch (_) {}
//   }
//
//   Future<void> logout() async {
//     try{
//       await _auth.signOut();
//       Get.offAll(()=> const LoginScreen());
//     } on FirebaseAuthException catch(e){
//       throw e.message!;
//     } on FormatException catch (e){
//       throw e.message;
//     } catch (e){
//       throw "Unable to logout. Try Again";
//     }
//   }
// }
