import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthPhone {
  Future submitPhoneNumber(String phoneNumber);
}

class AuthPhoneService extends AuthPhone {
  final firebase = FirebaseAuth.instance;
  late String verificationId;
  @override
  Future<dynamic> submitPhoneNumber(String phoneNumber) async {
    await firebase.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
  Future<void> signIn(PhoneAuthCredential credential) async {
    await firebase.signInWithCredential(credential);
  }


  void verificationCompleted(PhoneAuthCredential credential) async {
    print("verificationCompleted");
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print("error:${error.toString()}");
  }

  void codeSent(String verificationId, int? resendToken) async {
    this.verificationId = verificationId;
  }

  void codeAutoRetrievalTimeout(String verificationId) {}
}

