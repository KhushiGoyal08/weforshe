import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var isSignedIn = false.obs;
  User? get user => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    auth.authStateChanges().listen(_authStateChanges);
  }

  void _authStateChanges(User? user) {
    if (user == null) {
      isSignedIn.value = false;
      Get.offAllNamed('/login');
    } else {
      isSignedIn.value = true;
      Get.offAllNamed('/home');
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
