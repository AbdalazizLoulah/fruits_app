import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_list_view_loading.dart';
import 'package:fruits_app/feature/favorite/view/widgets/custom_favorite_card.dart';
import 'package:fruits_app/feature/favorite/view_model/get_user_favorite/cubit/get_user_favorite_cubit.dart';
import 'package:go_router/go_router.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  @override
  void initState() {
    context.read<GetUserFavoriteCubit>().getUserFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            CustomAppBar(title: "Favorite", centerTitle: true),
            BlocBuilder<GetUserFavoriteCubit, GetUserFavoriteState>(
              builder: (context, state) {
                if (state is GetUserFavoriteLoading) {
                  return CustomListViewLoading(h: h);
                }
                if (state is GetUserFavoriteSuccess) {
                  var data = state.data.data;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: h * 0.02,
                      vertical: h * 0.015,
                    ),
                    child: Container(
                      height: h * 0.75,
                      width: double.infinity,
                      child: data.isEmpty
                          ? Container(
                              child: Center(
                                child: Text("${state.data.message}"),
                              ),
                            )
                          : orientation == Orientation.portrait
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, count) {
                                  return CustomFavoriteCard(
                                    onTap: () {
                                      context.go("/product",extra: data[count]);
                                    },
                                    h: h,
                                    data: data[count].product,
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.all(12),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 1,
                                      crossAxisSpacing: 1,
                                      childAspectRatio: 6,
                                    ),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return CustomFavoriteCard(
                                    onTap: () {
                                      context.go(
                                        "/product",
                                        extra: data[index],
                                      );
                                    },
                                    h: h,
                                    data: data[index].product,
                                  );
                                },
                              ),
                            ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
