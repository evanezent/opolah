import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/cart.dart';
import 'package:opolah/ui/components/cart/cart_item.dart';
import 'package:opolah/ui/screens/shipping/shipping_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key, this.cartList}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();

  final List<Cart> cartList;
}

class _CartScreenState extends State<CartScreen> {
  List<bool> isCheck = [false, false];
  List<int> counter = [1, 1];
  List<int> price = [100000, 100000];
  List<int> totalPerItem = List<int>();
  int res = 0;
  bool allCheck = false;

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
      {int optionalValue}) {
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
      if (value >= 0) {
        setState(() {
          counter[index] = value;
          totalPerItem[index] = value * optionalValue;
        });
      }
    }

    if (isCheck[index]) {
      updateTotal(totalPerItem, isCheck);
    }
  }

  @override
  void initState() {
    super.initState();
    for (var item in price) {
      totalPerItem.add(item);
    }
    updateTotal(totalPerItem, isCheck);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "MY CART",
          style: TextStyle(color: colorPrimary, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: widget.cartList.length == 0
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(colorPrimary),
              ),
            )
          : Container(
              child: ListView(
              children: [
                CartItem(
                  size: size,
                  isCheck: isCheck[0],
                  qty: counter[0],
                  price: price[0],
                  callbackClick: (value) {
                    updateTotalEachItem(0, value, price[0]);
                  },
                  callbackType: (value) {
                    updateTotalEachItem(0, 'type', value,
                        optionalValue: price[0]);
                  },
                  callbackChecked: (value) {
                    setState(() {
                      isCheck[0] = value;
                    });
                    if (isCheck[0]) {
                      unCheck(0);
                    } else {
                      updateTotal(totalPerItem, isCheck);
                    }
                  },
                ),
                CartItem(
                  size: size,
                  isCheck: isCheck[1],
                  qty: counter[1],
                  price: price[1],
                  callbackClick: (value) {
                    updateTotalEachItem(1, value, price[1]);
                  },
                  callbackType: (value) {
                    updateTotalEachItem(1, 'type', value,
                        optionalValue: price[1]);
                  },
                  callbackChecked: (value) {
                    setState(() {
                      isCheck[1] = value;
                    });
                    if (isCheck[1]) {
                      unCheck(1);
                    } else {
                      updateTotal(totalPerItem, isCheck);
                    }
                  },
                ),
              ],
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
                            setState(() {
                              allCheck = value;
                            });
                            isCheckedAll(value);
                          }),
                      Text(
                        'Choose all item',
                        style: TextStyle(
                            color: colorPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                    child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.trash, color: colorSecondary),
                  onPressed: () {},
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: Center(
                        child: Text(
                  'Rp $res',
                  style: TextStyle(
                      color: colorSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
                RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: colorPrimary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShippingScreen()));
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
