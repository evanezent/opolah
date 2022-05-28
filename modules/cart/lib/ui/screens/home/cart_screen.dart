import 'package:cart/helper/dummy_data.dart';
import 'package:cart/models/cart.dart';
import 'package:cart/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/config/constants.dart';
import 'package:opolah/ui/widgets/buttons/long_button.dart';
import 'package:opolah/ui/widgets/buttons/small_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> totalPerItem = <int>[];
  List<Cart> cartList = [];
  List<bool> isCheck = [];
  List<int> counter = [];
  bool allCheck = false;
  List<int> price = [];
  String? userID;
  int res = 0;

  void resetData(List<Cart> carts) {
    setState(() {
      cartList = carts;
      isCheck = [];
      counter = [];
      price = [];
      totalPerItem = [];
      allCheck = false;
    });
  }

  void initData(Cart cart) {
    setState(() {
      isCheck.add(false);
      counter.add(int.parse(cart.getQuantity));
      price.add(cart.getItem.getPrice.toInt());
      int priceTemp =
          int.parse(cart.getQuantity) * cart.getItem.getPrice.toInt();
      totalPerItem.add(priceTemp);
    });

    updateTotal(totalPerItem, isCheck);
  }

  void updateTotal(List<int> listItem, List<bool> listChecked) {
    /*
      Update total price of items that checked
      Update if all item checked, then the "all's" checkbox is check
    */

    int temp = 0;
    bool isAllCheck = true;

    for (var i = 0; i < listItem.length; i++) {
      if (listChecked[i]) {
        temp = temp + listItem[i];
      }
      if (!listChecked[i]) {
        isAllCheck = false;
      }
    }

    setState(() {
      res = temp;
      isAllCheck ? allCheck = isAllCheck : allCheck = isAllCheck;
    });
  }

  void isCheckedAll(value) {
    /*
      Calculation if the "all's" checkbox is checked
    */

    for (var i = 0; i < isCheck.length; i++) {
      setState(() {
        isCheck[i] = value;
      });
      if (value) {
        updateTotal(totalPerItem, isCheck);
      } else {
        unCheck(i);
      }
    }
  }

  void unCheck(int itemIndex) {
    /*
      Update when item is un-checked
    */
    setState(() {
      res = res - totalPerItem[itemIndex];
    });

    updateTotal(totalPerItem, isCheck);
  }

  void updateTotalEachItem(int index, String callbackType, int value,
      {int? optionalValue}) {
    /*
      update total each item, curly braces params or {params} above is optional parameter that not should be use
      First IF - for function when click for increase
      Second IF - for function when click for decrease
      Third IF - for function when type on the text field
    */

    if (callbackType == 'increase') {
      setState(() {
        counter[index]++;
        totalPerItem[index] = totalPerItem[index] + value;
      });
    } else if (callbackType == 'decrease') {
      if (totalPerItem[index] > 0) {
        setState(() {
          counter[index]--;
          totalPerItem[index] = totalPerItem[index] - value;
        });
      }
    } else {
      print(value);
      if (value >= 0) {
        setState(() {
          counter[index] = value;
          totalPerItem[index] = value * optionalValue!;
        });
      }
    }

    if (isCheck[index]) {
      updateTotal(totalPerItem, isCheck);
    }
  }

  void checkout() {
    List<Cart> choosen = [];

    isCheck.asMap().forEach((key, value) {
      if (value) {
        cartList[key].setQuantity(counter[key].toString());
        choosen.add(cartList[key]);
      }
    });

    if (choosen.isNotEmpty) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             ShippingScreen(choosen: choosen, totalItemPrice: res)));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "MY CART",
          style: TextStyle(color: colorPrimary, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
          child: ListView.builder(
        itemCount: dummyCart!.length,
        itemBuilder: (context, index) => CartItem(
          item: dummyCart![index].getItem,
          size: size,
          isCheck: false,
          qty: 1,
          callbackClick: (value) {
            // updateTotalEachItem(index, value, price[index]);
          },
          callbackType: (value) {
            // updateTotalEachItem(index, 'type', value,
            //     optionalValue: price[index]);
          },
          callbackChecked: (value) {
            // setState(() {
            //   isCheck[index] = value;
            // });
            // if (isCheck[index]) {
            //   unCheck(index);
            // } else {
            //   updateTotal(totalPerItem, isCheck);
            // }
          },
        ),
      )),
      bottomNavigationBar: Container(
        height: 100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                          value: allCheck,
                          activeColor: colorPrimary,
                          checkColor: Colors.white,
                          onChanged: (value) {
                            // setState(() {
                            //   allCheck = value!;
                            // });
                            // isCheckedAll(value);
                          }),
                      const Text(
                        'Choose all item',
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.trash,
                      color: colorSecondary1),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Center(
                    child: Text(
                  'Rp 2000000',
                  style: TextStyle(
                      color: colorSecondary1,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                SmallButton(
                  text: "Checkout",
                  bgColor: colorPrimary,
                  textColor: Colors.white,
                  callback: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
