import 'package:bloc/bloc.dart';
import 'package:fruits_app/feature/Auth/logIn/data/model/sign_in.dart';
import 'package:fruits_app/feature/Auth/logIn/data/repo/log_in_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.logInRepo) : super(SignInInitial());
  LogInRepo logInRepo;
  Future logIn({required String phone, required String password}) async {
    emit(SignInLoading());
    var res = await logInRepo.logIn(phone: phone, password: password);
    res.fold(
      (failure) {
        emit(SignInFailure(massage: failure.errMassage));
      },
      (data) {
        emit(SignInSuccess(data: data));
      },
    );
  }
}
