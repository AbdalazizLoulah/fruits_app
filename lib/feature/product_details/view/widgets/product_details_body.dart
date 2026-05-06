import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_model.dart';
import 'package:fruits_app/feature/favorite/view_model/get_user_favorite/cubit/get_user_favorite_cubit.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_details_product.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_poster_product.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_select_weight.dart';
import 'package:fruits_app/feature/product_details/view_model/add_favorite_response/cubit/add_delete_favorit_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key, required this.data});
  final ProductModel data;
  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<GetUserFavoriteCubit>().getUserFavorite();
    super.initState();
  }

  bool showWeight = false;
  bool showAddons = false;
  bool? isFavorite;
  @override
  Widget build(BuildContext context) {
    bool isFav = false;
    var h = MediaQuery.of(context).size.height;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: BlocConsumer<AddDeleteFavoriteCubit, AddDeleteFavoriteState>(
            listener: (context, state) {
              if (state is AddDeleteFavoriteSuccess) {
                var data = state.data;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: data.result
                        ? Text('${data.errorMessage}')
                        : Text("${data.errorMessage}"),
                    backgroundColor: data.errorMessage == "تم الإضافة للمفضلة"
                        ? Colors.green
                        : Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
                context.read<GetUserFavoriteCubit>().getUserFavorite();
              }
            },
            builder: (context, state) {
              if (state is AddDeleteFavoriteLoading) {
                return Container(
                  height: h,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Column(
                children: [
                  BlocBuilder<GetUserFavoriteCubit, GetUserFavoriteState>(
                    builder: (context, state) {
                      
                      if (state is GetUserFavoriteSuccess) {
                        isFav = state.data.data.any(
                          (item) => item.product.id == widget.data.id,
                        );
                      }
                      return CustomAppBar(
                        onTap: () {
                          context.go('/nav', extra: 0);
                        },
                        title: "${widget.data.nameEn}",
                        centerTitle: true,
                        addIcons: false,
                        onTap1: () {
                          context
                              .read<AddDeleteFavoriteCubit>()
                              .addDeleteFavorite(id: widget.data.id);
                        },
                        icon1: isFav == true
                            ? Icons.favorite_outlined
                            : Icons.favorite_border,
                        icon2: Icons.ios_share,
                        backIcon: true,
                      );
                    },
                  ),
                  SizedBox(height: h * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPosterProduct(
                          h: h,
                          discound: widget.data.discount,
                        ),
                        SizedBox(height: h * 0.014),
                        CustomDetailsProduct(
                          h: h,
                          orientation: orientation,
                          data: widget.data,
                        ),
                        SizedBox(height: h * 0.014),
                        Text("${widget.data.detailsEn}"),
                        SizedBox(height: h * 0.014),
                        Text("${widget.data.unitEn}"),
                        SizedBox(height: h * 0.016),
                        CustomSelectWeight(
                          orientation: orientation,
                          itemCount: 3,
                          show: showWeight,
                          h: h,
                          title: "title".tr(),
                          icon: Icons.keyboard_arrow_up,
                          onTap: () {
                            setState(() {
                              showWeight = !showWeight;
                            });
                          },
                        ),
                        CustomSelectWeight(
                          orientation: orientation,
                          itemCount: 2,
                          onTap: () {
                            setState(() {
                              showAddons = !showAddons;
                            });
                          },
                          show: showAddons,
                          h: h,
                          title: "selectAddons".tr(),
                          icon: Icons.keyboard_arrow_down,
                        ),
                        SizedBox(height: h * 0.016),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomBottom(
                              onTap: () {
                                var box = Hive.box<ProductModel>('products');
                                bool exists = box.values.any(
                                  (e) => e.id == widget.data.id,
                                );
                                if (!exists) {
                                  box.add(widget.data);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(" Add To Cart"),
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                              width: orientation ? h * 0.15 : h * 0.3,
                              title: "addToCart".tr(),
                              heightBottom: orientation ? h * 0.04 : h * 0.07,
                              heightText: orientation ? h * 0.015 : h * 0.025,
                              colorBottom: ColorApp.green,
                              colorText: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.05),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
