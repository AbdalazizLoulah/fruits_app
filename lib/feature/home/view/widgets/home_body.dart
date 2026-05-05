import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_app/core/const/color_app.dart';

import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_list_category.dart';
import 'package:fruits_app/feature/home/view/widgets/custom_list_view_seller.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/home/view/widgets/custom_dialog.dart';
import 'package:fruits_app/feature/home/view/widgets/custom_slider.dart';
import 'package:fruits_app/feature/home/view_model/sellers/cubit/get_seller_cubit.dart';
import 'package:shimmer/shimmer.dart';


class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {"image": "assets/image/restorant.png", "title": ""},
      {"image": "assets/image/cafe.png", "title": ""},
      {"image": "assets/image/clinec.png", "title": ""},
      {"image": "assets/image/farm.png", "title": ""},
    ];
    PageController _pageController = PageController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: h * 0.02),
        child: Column(
          children: [
            CustomAppBar(
              icon1: Icons.search,
              icon2: Icons.tune,
              title: "Fruit Market",
              onTap2: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog(h: h, w: w);
                  },
                );
              },
            ),
            SizedBox(height: h * 0.02),
            CustomSlider(h: h, pageController: _pageController),
            SizedBox(height: h * 0.02),
            CustomListCategory(h: h, items: items, orientation: orientation),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  fontSize: h * 0.021,
                  color: Colors.black,
                  title: "Sellers",
                ),
                CustomText(
                  fontSize: h * 0.02,
                  color: ColorApp.blue,
                  title: "Show all",
                  fontFamily: false,
                ),
              ],
            ),
            BlocBuilder<GetSellerCubit, GetSellerState>(
              builder: (context, state) {
                if (state is GetSellerLoading) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, count) {
                        return Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.black,
                          enabled: true,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: h * 0.15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 10,
                                    spreadRadius: 0.1,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is GetSellerSuccess) {
                  var data = state.data;
                  return Expanded(
                    child: CustomListViewSeller(
                      data: data,
                      h: h,
                      w: w,
                      itemCount: 3,
                      orientation: orientation,
                    ),
                  );
                }
                if (state is GetSellerFailure) {
                  return Container(
                    child: Center(child: Text("${state.massage}")),
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
