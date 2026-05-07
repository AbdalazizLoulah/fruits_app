import 'package:bloc/bloc.dart';
import 'package:fruits_app/feature/contact_us/data/model/massage_response.dart';
import 'package:fruits_app/feature/contact_us/data/repo/contact_us_repo.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitial());
  ContactUsRepo contactUsRepo;
  Future sendMassage({
    required String name,
    required String massage,
    required String mobile,
  }) async {
    emit(ContactUsLoading());
    var res = await contactUsRepo.sendMassage(
      name: name,
      massage: massage,
      mobile: mobile,
    );
    res.fold(
      (failure) {
        emit(ContactUsFailure(massage: failure.errMassage));
      },
      (data) {
        emit(ContactUsSuccess(data: data));
      },
    );
  }
}
