import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/feature/Auth/forgetPassword/data/repo/forget_password_repo.dart';

class ForgetPasswordImplementationRepo implements ForgetPasswordRepo {
  late String verificationId;
  @override
  Future<void> forgetPassword(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
