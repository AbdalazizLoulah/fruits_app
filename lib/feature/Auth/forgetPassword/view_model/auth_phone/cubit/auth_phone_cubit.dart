import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_phone_state.dart';

class AuthPhoneCubit extends Cubit<AuthPhoneState> {
  late String verificationId;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthPhoneCubit() : super(AuthPhoneInitial());
  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(AuthPhoneLoading());
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+20$phoneNumber",
      verificationCompleted: verificationCompleted,
      timeout: Duration(seconds: 14),
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print("verificationCompleted");
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print("verificationFAilure:${error.toString()}");
    emit(AuthPhoneFailure(massage: error.toString()));
  }

  void codeSent(String verificationId, int? forceResendingToken) {
    print("codeSent");
    this.verificationId = verificationId;
    emit(AuthPhoneSuccess());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print("codeAutoRetrievalTimeout");
  }

  Future<void> submitOtp(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: this.verificationId,
      smsCode: otpCode,
    );
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await firebaseAuth.signInWithCredential(credential);
      emit(AuthPhoneOtpSuccess());
    } catch (error) {
      emit(AuthPhoneFailure(massage: error.toString()));
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  User getLogInUser() {
    return firebaseAuth.currentUser!;
  }
}
