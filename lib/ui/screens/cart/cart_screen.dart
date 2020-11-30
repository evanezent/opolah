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
  bool isCheck = false;
  List<int> counter = [1, 1];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    total = qty;
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
          // CallbackF(
          //   callback: () {
          //     setState(() {
          //       total++;
          //     });
          //   },
          // ),
          CartItem(
            size: size,
            isCheck: isCheck,
            qty: counter[0],
            callbackDecrease: (value, newQty) {
              if (total > 0) {
                setState(() {
                  total = total - value;
                  counter[0] = newQty;
                });
              }
            },
            callbackIncrease: (value, newQty) {
              setState(() {
                total = total + value;
                counter[0] = newQty;
              });
            },
            callbackChecked: (value) {
              setState(() {
                isCheck = value;
              });
            },
          ),
        ],
      )),
      bottomNavigationBar: Container(
        child: Text('TOTAL : $total'),
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
  }) : super(key: key);

  final Size size;
  final bool isCheck;
  final int qty;

  final Function callbackIncrease;
  final Function callbackDecrease;
  final Function callbackChecked;

  TextEditingController txtQty;
  int price = 100000;
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
                                  localQty = int.parse(txtQty.text);
                                  if (qty > 0) {
                                    localQty--;
                                    this.txtQty.text = localQty.toString();

                                    int result = price * localQty;
                                    callbackDecrease(result, localQty);
                                  }
                                }),
                            Container(
                              width: 30,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                controller: txtQty,
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
                                  localQty++;
                                  print('+++ ${localQty}');
                                  localQty = int.parse(txtQty.text);
                                  this.txtQty.text = localQty.toString();

                                  int result = price * localQty;
                                  callbackIncrease(result, localQty);
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
