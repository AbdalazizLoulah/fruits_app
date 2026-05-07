import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/details_seller_body.dart';
import 'package:fruits_app/feature/home/data/model/vendor_model.dart';
import 'package:fruits_app/feature/product_details/data/repo/product_details_repo_implementation.dart';
import 'package:fruits_app/feature/product_details/view_model/get_product_sells/cubit/get_product_sells_cubit.dart';

class DetailsSellerScreen extends StatelessWidget {
  const DetailsSellerScreen({super.key, required this.id});
  final VendorModel id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => GetProductSellsCubit(
            ProductDetailsRepoImplementation(apiService: ApiService(dio: Dio())),
          )..getProduct(id: id.id),
          child: DetailsSellerBody(id: id),
        ),
      ),
    );
  }
}
