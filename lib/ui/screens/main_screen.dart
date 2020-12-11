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

  void getShopItem() async {
    var data = _itemRepository.getStream();

    await data.then((value) {
      setState(() {
        itemList = value;
      });
    });
    buildPage();
  }

  void buildPage() {
    print("======================");
    setState(() {
      pagesList[0] = HomeScreen(listItem: itemList);
      pagesList[1] = ShopScreen(itemList: itemList);
    });
  }

  void getAllCart() async {
    var data = await _cartRepository.getAllCart();

    setState(() {
      cartList = data;
      pagesList[2] = CartScreen(cartList: cartList);
    });

    print("ASDASDADS");
    print(cartList.length);
  }

  List<Widget> pagesList = [];
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pagesList.add(HomeScreen(listItem: itemList));
    pagesList.add(ShopScreen(itemList: itemList));
    pagesList.add(CartScreen(cartList: cartList));
    pagesList.add(ProfileScreen());
    getShopItem();
    getAllCart();
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
