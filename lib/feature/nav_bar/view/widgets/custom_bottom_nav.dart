import 'package:flutter/material.dart';
import 'package:fruits_app/feature/home/view/widgets/home_body.dart';
import 'package:fruits_app/feature/nav_bar/view/widgets/custom_animated_container.dart';
import 'package:fruits_app/feature/orders/view/orders_screen.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CustomBottomNav> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeBody(),
    OrdersScreen(),
    Center(child: Text("Your Page basket", style: TextStyle(fontSize: 22))),
    Center(child: Text("Your Page favorite", style: TextStyle(fontSize: 22))),
    Center(child: Text("Your Page more", style: TextStyle(fontSize: 22))),
  ];
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.home_outlined, "label": "Home"},
    {"icon": Icons.format_list_numbered, "label": "Orders"},
    {"icon": Icons.shopping_basket_outlined, "label": "Basket"},
    {"icon": Icons.favorite_border, "label": "Favorite"},
    {"icon": Icons.menu, "label": "More"},
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
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
          children: List.generate(items.length, (index) => navItem(index,h)),
        ),
      ),
    );
  }

  Widget navItem(int index,double h) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: CustomAnimatedContainer(
        size:h*0.035,
        isSelected: isSelected,
        items: items,
        index: index,
      ),
    );
  }
}
