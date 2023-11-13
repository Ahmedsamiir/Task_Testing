import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:task_testing/core/repository/authentication_repository/authentication_repository.dart';
import 'package:task_testing/core/repository/user_repository/user_repository.dart';
import 'package:task_testing/feature/authentication/controller/signup_controller.dart';
import 'package:task_testing/feature/view_screen/presentation/view_screen.dart';

class DynamicLinkController extends GetxController {
  // static DynamicLinkController get instance => Get.find();

  /// Repositories
  final _authRepo = AuthenticationRepository.instance;
  final _userRepo = UserRepository.instance;

  static final controller = Get.put(SignUpController());
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  /// --- Create the link
  Future<String> createDynamicLink(bool short, String refName) async {
    //String? _linkMessage;
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://www.mylink.com/$refName"),
      uriPrefix: "https://tasktesting.page.link",
      androidParameters: const AndroidParameters(packageName: "com.example.task_testing", minimumVersion: 0),
      iosParameters: const IOSParameters(bundleId: "com.example.task_testing", minimumVersion: "0"),
    );
    final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams).then((value) {
        print(value.shortUrl.queryParameters);
    });

    return dynamicLink.toString();

    // Uri url;
    // if (short){
    //   final shortLink = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    //   url = shortLink.shortUrl;
    // }else{
    //   url = await FirebaseDynamicLinks.instance.buildLink(parameters);
    // }

    // _linkMessage = url.toString();
    // return _linkMessage;
  }

  /// --- Init Dynamic link

  void initDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;
      Share.share("This is the link ${refLink.data}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    initDynamicLink();
  }
}
