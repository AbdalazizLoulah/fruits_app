import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_model.dart';
import 'package:fruits_app/feature/favorite/view_model/get_user_favorite/cubit/get_user_favorite_cubit.dart';
import 'package:fruits_app/feature/product_details/view/widgets/product_details_body.dart';
import 'package:fruits_app/feature/product_details/view_model/add_favorite_response/cubit/add_delete_favorit_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.data});
  final ProductModel data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AddDeleteFavoriteCubit(ApiService(dio: Dio())),
            ),
            BlocProvider(create: (context) => GetUserFavoriteCubit(ApiService(dio: Dio()))),
          ],
          child: ProductDetailsBody(data: data),
        ),
      ),
    );
  }
}
