import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/address.dart';
import 'package:opolah/models/cart.dart';
import 'package:opolah/ui/components/bottom_nav_button.dart';
import 'package:opolah/ui/components/horizontal_divider.dart';
import 'package:opolah/ui/components/shipping/address_card.dart';
import 'package:opolah/ui/components/shipping/shipping_item.dart';
import 'package:opolah/ui/screens/payment/payment_screen.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({Key key, this.choosen, this.totalItemPrice})
      : super(key: key);

  @override
  _ShippingScreenState createState() => _ShippingScreenState();

  final List<Cart> choosen;
  final int totalItemPrice;
}

class _ShippingScreenState extends State<ShippingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Duration _duration = Duration(milliseconds: 500);
  TextEditingController textName = new TextEditingController();
  TextEditingController textPhone = new TextEditingController();
  TextEditingController textAddress = new TextEditingController();
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: colorSecondary,
                child: FaIcon(FontAwesomeIcons.times, color: Colors.white),
              ),
            ),
            Center(
              child: Container(
                height: size.height * 0.7,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: darkShadow),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Your Shipping",
                              style: TextStyle(
                                  color: colorPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                          ]))),
                    ),
                    SizedBox(height: 8),
                    HorizontalDivider(
                      width: 70,
                    ),
                    SizedBox(height: 20),
                    Text('Delivery Address',
                        style: TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () async {
                                if (_controller.isDismissed) {
                                  _controller.forward();
                                } else if (_controller.isCompleted) {
                                  _controller.reverse();
                                }
                              },
                              child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (context, child) => Container(
                                        height: 150,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: colorPrimary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: FaIcon(FontAwesomeIcons.plus,
                                                color: Colors.white)),
                                      ))),
                          Container(
                            width: size.width * 0.65,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  AddressCard(
                                      size: size,
                                      name: 'Pratama Yoga',
                                      phone: '0812378234',
                                      address:
                                          'Jl Sukabirus No 22, Sukabirus, Citeureup, Dayeuhkolot, Kabupaten Bandung, Jawa Barat. 4027',
                                      choose: true,
                                      onChoose: () {}),
                                  AddressCard(
                                      size: size,
                                      name: 'Santosa Mike',
                                      phone: '0812378234',
                                      address:
                                          'Jl Sukabirus No 22, Sukabirus, Citeureup, Dayeuhkolot, Kabupaten Bandung, Jawa Barat. 4027',
                                      choose: false,
                                      onChoose: () {}),
                                  AddressCard(
                                      size: size,
                                      name: 'Billie Joe',
                                      phone: '0812378234',
                                      address:
                                          'Jl Sukabirus No 22, Sukabirus, Citeureup, Dayeuhkolot, Kabupaten Bandung, Jawa Barat. 4027',
                                      choose: false,
                                      onChoose: () {}),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        color: Colors.white,
                        height: 200,
                        child: ListView.builder(
                          itemCount: widget.choosen.length,
                          itemBuilder: (context, index) =>
                              ShippingItem(choosenItem: widget.choosen[index]),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bars,
                            color: colorPrimary,
                            size: 12,
                          ),
                          FaIcon(
                            FontAwesomeIcons.truck,
                            color: colorPrimary,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Rp 20.000.00",
                            style: TextStyle(
                                color: colorPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HorizontalDivider(
                          width: 270,
                        ),
                        SizedBox(width: 10),
                        FaIcon(
                          FontAwesomeIcons.plus,
                          size: 15,
                          color: colorPrimary,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Shipping",
                            style: TextStyle(
                                color: colorSecondary,
                                fontWeight: FontWeight.w300,
                                fontSize: 20),
                          ),
                          Text(
                            "Rp ${widget.totalItemPrice + 20000}",
                            style: TextStyle(
                                color: colorSecondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: SlideTransition(
                position: _tween.animate(_controller),
                child: DraggableScrollableSheet(
                  maxChildSize: 0.65,
                  initialChildSize: 0.65,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 30),
                        color: colorPrimary,
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Text('Add Address',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Form(
                                child: Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      controller: textName,
                                      style: TextStyle(
                                          color: colorPrimary,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18),
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.length < 6)
                                          return "Name is too short";
                                        else
                                          return null;
                                      },
                                      decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: colorPrimary),
                                          hintText: 'Name',
                                          hintStyle:
                                              TextStyle(color: colorPrimary),
                                          focusColor: Colors.white,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      controller: textPhone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9]")),
                                      ],
                                      style: TextStyle(
                                          color: colorPrimary,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value.length < 9)
                                          return "Phone number doesn't valid";
                                        else
                                          return null;
                                      },
                                      decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: colorPrimary),
                                          hintText: 'Phone',
                                          hintStyle:
                                              TextStyle(color: colorPrimary),
                                          focusColor: Colors.white,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      maxLines: 7,
                                      controller: textAddress,
                                      style: TextStyle(
                                          color: colorPrimary,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18),
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.length < 6)
                                          return "Address is too short";
                                        else
                                          return null;
                                      },
                                      decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: colorPrimary),
                                          hintText: 'Address',
                                          hintStyle:
                                              TextStyle(color: colorPrimary),
                                          focusColor: Colors.white,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) => RaisedButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        color: colorSecondary,
                                        onPressed: () {
                                          _controller.reverse();
                                        },
                                        child: Container(
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ))),
                                RaisedButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: Colors.white,
                                    onPressed: () {
                                      Address newAddress = Address(
                                        receiver: textName.text,
                                        phone: textName.text,
                                        address: textAddress.text
                                      );
                                    },
                                    child: Container(
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'Add',
                                          style: TextStyle(
                                              color: colorPrimary,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNav(
        text: "CONFIRM",
        bgColor: colorPrimary,
        textColor: Colors.white,
        onClick: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PaymentScreen()));
        },
      ),
    );
  }
}
