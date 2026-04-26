import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/feature/basket/view/basket_screen.dart';
import 'package:fruits_app/feature/favorite/view/favorite_screen.dart';
import 'package:fruits_app/feature/home/view/widgets/home_body.dart';
import 'package:fruits_app/feature/more/view/more_screen.dart';
import 'package:fruits_app/feature/nav_bar/view/widgets/custom_animated_container.dart';
import 'package:fruits_app/feature/orders/view/orders_screen.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  State<CustomBottomNav> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CustomBottomNav> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    super.initState();
  }

  List<Widget> screens = [
    HomeBody(),
    OrdersScreen(),
    BasketScreen(),
    FavoriteScreen(),
    MoreScreen(),
  ];
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.home_outlined, "label": "home".tr()},
    {"icon": Icons.format_list_numbered, "label": "orders".tr()},
    {"icon": Icons.shopping_basket_outlined, "label": "basket".tr()},
    {"icon": Icons.favorite_border, "label": "favorite".tr()},
    {"icon": Icons.menu, "label": "more".tr()},
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: h * 0.022),
          decoration: BoxDecoration(
            color: const Color(0xFF1F6A4A), // dark green
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(h * 0.03),
              topRight: Radius.circular(h * 0.03),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              items.length,
              (index) => navItem(index, h, orientation),
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(int index, double h, bool Orientation) {
    bool orientation=Orientation;
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
          orientation = Orientation;
        });
      },
      child: CustomAnimatedContainer(
        size:orientation? h * 0.025:h*0.06,
        isSelected: isSelected,
        items: items,
        index: index,
      ),
    );
  }
}
