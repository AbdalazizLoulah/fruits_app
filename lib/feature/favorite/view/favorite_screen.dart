import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/favorite/data/repo/favorite_repo_implementation.dart';
import 'package:fruits_app/feature/favorite/view/widgets/favorite_body.dart';
import 'package:fruits_app/feature/favorite/view_model/get_user_favorite/cubit/get_user_favorite_cubit.dart';
import 'package:fruits_app/feature/product_details/data/repo/product_details_repo.dart';
import 'package:fruits_app/feature/product_details/data/repo/product_details_repo_implementation.dart';
import 'package:fruits_app/feature/product_details/view_model/add_favorite_response/cubit/add_delete_favorit_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserFavoriteCubit(
            FavoriteRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => AddDeleteFavoriteCubit(
            ProductDetailsRepoImplementation(
              apiService: ApiService(dio: Dio()),
            ),
          ),
        ),
      ],
      child: FavoriteBody(),
    );
  }
}
