import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home/ui/screens/home/home_screen.dart';
import 'package:opolah/config/constants.dart';
import 'package:profile/ui/screens/profile/profile_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key? key, this.currentPageIndex = 0})
      : super(key: key);

  @override
  _MainLayoutScreenState createState() => _MainLayoutScreenState();

  final int currentPageIndex;
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  List<Widget> pagesList = [];
  int? _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.currentPageIndex;
    pagesList.add(const HomeScreen());
    pagesList.add(const HomeScreen());
    pagesList.add(const HomeScreen());
    pagesList.add(const ProfileScreen());
    // pagesList.add(ShopScreen());
    // pagesList.add(CartScreen());
    // pagesList.add(ProfileScreen());
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
        selectedIndex: _currentPageIndex!,
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
            icon: const FaIcon(FontAwesomeIcons.home),
            title: const Text('Home'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const FaIcon(FontAwesomeIcons.shopify),
            title: const Text('Shop'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const FaIcon(FontAwesomeIcons.shoppingCart),
            title: const Text(
              'Cart',
            ),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const FaIcon(FontAwesomeIcons.solidUser),
            title: const Text('Profile'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
