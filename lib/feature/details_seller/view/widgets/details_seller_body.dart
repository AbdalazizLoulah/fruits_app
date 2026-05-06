import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_list_category.dart';
import 'package:fruits_app/core/widget/custom_list_view_loading.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_model.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_details_seller_cart.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';
import 'package:fruits_app/feature/home/data/model/vendor_model.dart';
import 'package:fruits_app/feature/product_details/view_model/get_product_sells/cubit/get_product_sells_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class DetailsSellerBody extends StatefulWidget {
  const DetailsSellerBody({super.key, required this.id});
  final VendorModel id;

  @override
  State<DetailsSellerBody> createState() => _DetailsSellerBodyState();
}

class _DetailsSellerBodyState extends State<DetailsSellerBody> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {"image": "assets/image/Fruits.png", "title": "Fruits"},
      {"image": "assets/image/vegetables.png", "title": "Vegetables"},
      {"image": "assets/image/phone.png", "title": "Photo"},
      {"image": "assets/image/animal.png", "title": "Pets"},
    ];
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      child: Column(
        children: [
          CustomAppBar(
            onTap: () {
              context.go('/nav');
            },
            title: "FruitMarket",
            centerTitle: true,
            addIcons: false,
            icon2: Icons.search,
            backIcon: true,
          ),
          CustomDetailsSellerCart(
            h: h,
            w: w,
            orientation: orientation,
            data: widget.id,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  fontSize: orientation ? h * 0.02 : h * 0.03,
                  color: Colors.black,
                  title: "Category",
                ),
                CustomListCategory(
                  h: h,
                  items: items,
                  orientation: orientation,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      fontSize: orientation ? h * 0.02 : h * 0.03,
                      color: Colors.black,
                      title: "Products",
                    ),
                    Icon(Icons.format_line_spacing_outlined),
                  ],
                ),
                BlocBuilder<GetProductSellsCubit, GetProductSellsState>(
                  builder: (context, state) {
                    if (state is GetProductSellsLoading) {
                      return CustomListViewLoading(h: h);
                    }
                    if (state is GetProductSellsSuccess) {
                      var data = state.data.data;
                      return SizedBox(
                        height: orientation ? h * 0.5 : h * 0.25,
                        child: orientation
                            ? ListView.builder(
                                itemCount: data.length,
                                padding: EdgeInsets.only(top: 8),
                                itemBuilder: (context, count) {
                                  return GestureDetector(
                                    onTap: () {
                                      context.go(
                                        '/product',
                                        extra: data[count],
                                      );
                                    },
                                    child: CustomProductCart(
                                      addCart: () {
                                        var box = Hive.box<ProductModel>(
                                          'products',
                                        );
                                        bool exists = box.values.any(
                                          (e) => e.id == data[count].id,
                                        );
                                        if (!exists) {
                                          box.add(data[count]);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(" Add To Cart"),
                                              backgroundColor: Colors.green,
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        }
                                      },
                                      h: h,
                                      w: w,
                                      title: "",
                                      data: data[count],
                                    ),
                                  );
                                },
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: h * 0.02),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 2,
                                        crossAxisSpacing: 2,
                                        childAspectRatio: 6,
                                      ),
                                  itemCount: items.length,
                                  itemBuilder: (context, count) =>
                                      GestureDetector(
                                        onTap: () {
                                          context.push(
                                            '/product',
                                            extra: data[count],
                                          );
                                        },
                                        child: CustomProductCart(
                                          addCart: () {
                                            var box = Hive.box<ProductModel>(
                                              'products',
                                            );
                                            setState(() {
                                              box.add(data[count]);
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(""),
                                                  backgroundColor: Colors.green,
                                                  duration: Duration(
                                                    seconds: 2,
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                          data: data[count],
                                          h: h,
                                          w: w,
                                          title: "",
                                        ),
                                      ),
                                ),
                              ),
                      );
                    }
                    if (state is GetProductSellsFailure) {
                      return Center(
                        child: Container(
                          child: Center(child: Text("${state.massage}")),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
