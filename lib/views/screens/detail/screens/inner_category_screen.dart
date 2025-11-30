import 'package:flutter/material.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/views/screens/detail/screens/widgets/inner_category_content_widget.dart';
import 'package:store_app/views/screens/nav_screens/account_screen.dart';
import 'package:store_app/views/screens/nav_screens/cart_screen.dart';
import 'package:store_app/views/screens/nav_screens/category_screen.dart';
import 'package:store_app/views/screens/nav_screens/favorite_screen.dart';
import 'package:store_app/views/screens/nav_screens/home_screen.dart';
import 'package:store_app/views/screens/nav_screens/store_screen.dart';

class InnerCategoryScreen extends StatefulWidget {
  final Category category;
  const InnerCategoryScreen({super.key, required this.category});

  @override
  State<InnerCategoryScreen> createState() => _InnerCategoryScreenState();
}

class _InnerCategoryScreenState extends State<InnerCategoryScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      InnerCategoryContentScreen(category: widget.category),
      FavoriteScreen(),
      CategoryScreen(),
      StoreScreen(),
      CartScreen(),
      AccountScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home.png", width: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/love.png", width: 25),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/mart.png", width: 25),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/cart.png", width: 25),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/user.png", width: 25),
            label: 'Account',
          ),
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
