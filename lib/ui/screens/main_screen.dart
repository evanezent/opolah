import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/cart.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/repositories/cart_repo.dart';
import 'package:opolah/repositories/item_repo.dart';
import 'package:opolah/ui/screens/cart/cart_screen.dart';
import 'package:opolah/ui/screens/home/home_screen.dart';
import 'package:opolah/ui/screens/profile/profile_screen.dart';
import 'package:opolah/ui/screens/shop/shop_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ItemRepository _itemRepository = ItemRepository();
  CartRepository _cartRepository = CartRepository();
  List<Item> itemList = [];
  List<Cart> cartList = [];

  void getShopItem() {
    var data = _itemRepository.getStream();

    data.then((value) {
      setState(() {
        itemList = value;
      });
    });
  }

  void buildPage() {
    setState(() {
      pagesList[0] = HomeScreen(listItem: itemList);
      pagesList[1] = ShopScreen(itemList: itemList);
      pagesList[2] = CartScreen(cartList: cartList);
    });
  }

  void getAllCart() {
    var data = _cartRepository.getAllCart();

    data.then((value) async {
      await setState(() {
        cartList = value;
      });
    });
  }

  List<Widget> pagesList = [];
  int _currentPageIndex = 0;

  @override
  void initState() async {
    super.initState();
    pagesList.add(HomeScreen(listItem: itemList));
    pagesList.add(ShopScreen(itemList: itemList));
    pagesList.add(CartScreen(cartList: cartList));
    pagesList.add(ProfileScreen());
    // ignore: await_only_futures
    await getShopItem();
    // ignore: await_only_futures
    await getAllCart();
    buildPage();
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
