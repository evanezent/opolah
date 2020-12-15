import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/item.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartItem({
    Key key,
    @required this.size,
    @required this.isCheck,
    @required this.qty,
    this.callbackClick,
    this.callbackChecked,
    this.price,
    this.callbackType,
    this.item,
  }) : super(key: key);

  final Size size;
  final bool isCheck;
  final int qty;
  final Item item;

  final Function callbackClick;
  final Function callbackType;
  final Function callbackChecked;

  TextEditingController txtQty;
  final int price;

  @override
  Widget build(BuildContext context) {
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
                    item.getImage,
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
                      item.getName,
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
                            'Rp ${item.getPrice}',
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
                                  callbackClick('decrease');
                                }),
                            Container(
                              width: 30,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                controller: txtQty,
                                onChanged: (value) {
                                    int passValue = int.parse(value);
                                  txtQty.addListener(() {
                                    callbackType(passValue);
                                  });
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
                                  callbackClick('increase');
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
