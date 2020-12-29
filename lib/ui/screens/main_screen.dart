import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/cart.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/repositories/item_repo.dart';
import 'package:opolah/ui/screens/cart/cart_screen.dart';
import 'package:opolah/ui/screens/home/home_screen.dart';
import 'package:opolah/ui/screens/profile/profile_screen.dart';
import 'package:opolah/ui/screens/shop/shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key, this.currentPageIndex = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();

  final int currentPageIndex;
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pagesList = [];
  int _currentPageIndex;


  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.currentPageIndex;
    pagesList.add(HomeScreen());
    pagesList.add(ShopScreen());
    pagesList.add(CartScreen());
    pagesList.add(ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: pagesList,
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: colorPrimary,
        selectedIndex: _currentPageIndex,
        showElevation: true,
        itemCornerRadius: 25,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            title: Text('Home'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.shopify),
            title: Text('Shop'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.shoppingCart),
            title: Text(
              'Cart',
            ),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            title: Text('Profile'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
