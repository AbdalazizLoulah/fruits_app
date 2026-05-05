import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/favorite/data/model/favorite_product_model.dart';
import 'package:fruits_app/feature/favorite/view_model/get_user_favorite/cubit/get_user_favorite_cubit.dart';
import 'package:fruits_app/feature/product_details/view_model/add_favorite_response/cubit/add_delete_favorit_cubit.dart';

class CustomFavoriteCard extends StatelessWidget {
  const CustomFavoriteCard({
    super.key,
    required this.h,
    required this.data, this.onTap,
  });

  final double h;
  final Product data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: h * 0.17,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            h * 0.02,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 0.1,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: h * 0.12,
              width: h * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  h * 0.1,
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      0.15,
                    ),
                    blurRadius: 10,
                    spreadRadius: 0.1,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadiusGeometry.circular(
                      h * 0.1,
                    ),
                child: Image.asset(
                  "assets/image/logo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: h * 0.03,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    fontSize: h * 0.02,
                    color: Colors.black,
                    title:
                        "${data.nameEn}",
                  ),
                  Row(
                    children: [
                      CustomText(
                        fontSize: h * 0.015,
                        color: Colors.black,
                        title:
                            "${data.price.toDouble()}0 KD",
                      ),
                      SizedBox(width: h * 0.01),
                      Stack(
                        children: [
                          CustomText(
                            fontSize: h * 0.015,
                            color: Colors.grey,
                            title:
                                "${data.discount.toDouble()}0 KD",
                          ),
                          CustomText(
                            fontSize: h * 0.015,
                            color: Colors.grey,
                            title: "-------",
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomText(
                    fontSize: h * 0.015,
                    color: Colors.black,
                    title:
                        "Store Name: ${data.nameCategoryEn}",
                  ),
                ],
              ),
            ),
            BlocListener<
              AddDeleteFavoriteCubit,
              AddDeleteFavoriteState
            >(
              listener: (context, state) {
                if(state is AddDeleteFavoriteSuccess){
                  context
                      .read<GetUserFavoriteCubit>()
                      .getUserFavorite();
                }
                
              },
              child: GestureDetector(
                  onTap: () {
                    context
                        .read<
                          AddDeleteFavoriteCubit
                        >()
                        .addDeleteFavorite(
                          id: data
                              .id,
                        );
                    
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: h * 0.02,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(
                                  h * 0.05,
                                ),
                            border: BoxBorder.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
