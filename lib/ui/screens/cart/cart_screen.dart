import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty = 0;
  int total;
  List<bool> isCheck = [false, false];
  List<int> counter = [1, 1];
  List<int> price = [100000, 100000];
  List<int> totalPerItem = List<int>();
  int res = 0;

  void updateTotal(List<int> listItem, List<bool> listChecked) {
    for (var i = 0; i < listItem.length; i++) {
      print(listChecked[i]);
      print(listItem[i]);
      if (listChecked[i]) {
        setState(() {
          res = res + listItem[i];
        });
      }
    }
  }

  void unCheck(int itemIndex, List<int> listItem) {
    setState(() {
      res = res - listItem[itemIndex];
    });
  }

  @override
  void initState() {
    super.initState();
    for (var item in price) {
      totalPerItem.add(item);
    }
    updateTotal(totalPerItem, isCheck);
    print("AAAAAAAAAAAAAA${res}");
    total = price[0];
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
          style: TextStyle(color: colorPrimary),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
          child: ListView(
        children: [
          CartItem(
            size: size,
            isCheck: isCheck[0],
            qty: counter[0],
            price: price[0],
            callbackDecrease: (value) {
              if (total > 0) {
                setState(() {
                  counter[0]--;
                  totalPerItem[0] = totalPerItem[0] - value;
                });
                if (isCheck[0]) {
                  updateTotal(totalPerItem, isCheck);
                }
              }
            },
            callbackType: (value, price) {
              print('$value ,,,,,,,, $price');
              if (value >= 0) {
                setState(() {
                  counter[0] = value;
                  totalPerItem[0] = value * price;
                });
                if (isCheck[0]) {
                  updateTotal(totalPerItem, isCheck);
                }
              }
            },
            callbackIncrease: (value) {
              setState(() {
                counter[0]++;
                totalPerItem[0] = totalPerItem[0] + value;
              });
              if (isCheck[0]) {
                updateTotal(totalPerItem, isCheck);
              }
            },
            callbackChecked: (value) {
              setState(() {
                isCheck[0] = value;
              });
              if (!isCheck[0]) {
                unCheck(0, totalPerItem);
              }
              updateTotal(totalPerItem, isCheck);
            },
          ),
          CartItem(
            size: size,
            isCheck: isCheck[1],
            qty: counter[1],
            price: price[1],
            callbackDecrease: (value) {
              if (total > 0) {
                setState(() {
                  counter[1]--;
                  totalPerItem[1] = totalPerItem[1] - value;
                });

                if (isCheck[1]) {
                  updateTotal(totalPerItem, isCheck);
                }
              }
            },
            callbackType: (value, price) {
              print('$value ,,,,,,,, $price');
              if (value >= 0) {
                setState(() {
                  counter[1] = value;
                  totalPerItem[1] = value * price;
                });
                if (isCheck[1]) {
                  updateTotal(totalPerItem, isCheck);
                }
              }
            },
            callbackIncrease: (value) {
              setState(() {
                counter[1]++;
                totalPerItem[1] = totalPerItem[1] + value;
              });
              if (isCheck[1]) {
                updateTotal(totalPerItem, isCheck);
              }
            },
            callbackChecked: (value) {
              setState(() {
                isCheck[1] = value;
              });

              if (!isCheck[1]) {
                unCheck(1, totalPerItem);
              }
              updateTotal(totalPerItem, isCheck);
            },
          ),
        ],
      )),
      bottomNavigationBar: Container(
        child: Text('TOTAL : $res'),
      ),
    );
  }
}

// TODO : CANNOT UPDATE QUANTITY
class CartItem extends StatelessWidget {
  CartItem({
    Key key,
    @required this.size,
    @required this.isCheck,
    @required this.qty,
    this.callbackIncrease,
    this.callbackDecrease,
    this.callbackChecked,
    this.price,
    this.callbackType,
  }) : super(key: key);

  final Size size;
  final bool isCheck;
  final int qty;

  final Function callbackIncrease;
  final Function callbackDecrease;
  final Function callbackType;
  final Function callbackChecked;

  TextEditingController txtQty;
  final int price;
  int localQty;

  @override
  Widget build(BuildContext context) {
    localQty = qty;
    String casting = qty.toString();
    txtQty = TextEditingController(text: casting);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                    'https://d19kzigy6tpscu.cloudfront.net/media/boutique/index/2019/05/03/Cool_Shirtz_8ZU0T.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Bomber Jacket - Death edition',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: colorPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 7),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.25,
                          child: Text(
                            'Rp 100.000',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: colorSecondary),
                          ),
                        ),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.minus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  print('--- ${localQty}');
                                  callbackDecrease(price);
                                }),
                            Container(
                              width: 30,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                controller: txtQty,
                                onChanged: (value) {
                                  callbackType(value, price);
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]")),
                                ],
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: colorPrimary.withOpacity(0.3)),
                                ),
                              ),
                            ),
                            IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  print('+++ ${localQty}');
                                  callbackIncrease(price);
                                })
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            child: Checkbox(
                value: isCheck,
                activeColor: colorPrimary,
                checkColor: Colors.white,
                onChanged: (value) {
                  callbackChecked(value);
                }),
          )
        ],
      ),
    );
  }
}
