import 'package:bloc/bloc.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_response.dart';
import 'package:fruits_app/feature/product_details/data/repo/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'get_product_sells_state.dart';

class GetProductSellsCubit extends Cubit<GetProductSellsState> {
  GetProductSellsCubit(this.productDetailsRepo)
    : super(GetProductSellsInitial());
  ProductDetailsRepo productDetailsRepo;
  Future getProduct({required int id}) async {
    emit(GetProductSellsLoading());
    var res=await productDetailsRepo.getProductSells(id: id);
    res.fold(
      (failure) {
        emit(GetProductSellsFailure(massage: failure.errMassage));
      },
      (data) {
        emit(GetProductSellsSuccess(data: data));
      },
    );
  }
}
