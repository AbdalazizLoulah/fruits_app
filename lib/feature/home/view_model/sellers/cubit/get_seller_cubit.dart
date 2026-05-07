import 'package:bloc/bloc.dart';
import 'package:fruits_app/feature/home/data/model/vendor_response.dart';
import 'package:fruits_app/feature/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';
part 'get_seller_state.dart';

class GetSellerCubit extends Cubit<GetSellerState> {
  GetSellerCubit(this.homeRepo) : super(GetSellerInitial());
  HomeRepo homeRepo;
  Future getSellers() async {
    emit(GetSellerLoading());
    var res = await homeRepo.getSellers();
    res.fold(
      (failure) {
        emit(GetSellerFailure(massage: failure.errMassage));
      },
      (data) {
        emit(GetSellerSuccess(data: data));
      },
    );
  }
}
