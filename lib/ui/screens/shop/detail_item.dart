import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/item-type.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/repositories/item_type_repo.dart';
import 'package:opolah/ui/components/shop/bottom_nav_item.dart';

class DetailItem extends StatefulWidget {
  const DetailItem({Key key, this.item}) : super(key: key);

  @override
  _DetailItemState createState() => _DetailItemState();
  final Item item;
}

class _DetailItemState extends State<DetailItem> {
  ItemTypeRepository _itemTypeRepository = ItemTypeRepository();
  List<ItemType> typeList;

  void getItemTypes() {
    var data = _itemTypeRepository.getItemType(widget.item.getID);

    data.then((value) {
      setState(() {
        typeList = value;
      });
    });
  }

  List images = [
    ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
      child: Image.asset(
        'assets/images/banner1.jpg',
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Image.asset(
          'assets/images/banner2.jpg',
          fit: BoxFit.cover,
        )),
    ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Container(
          child: Image.asset(
            'assets/images/banner3.jpg',
            fit: BoxFit.cover,
          ),
        )),
  ];

  double _currentPageIndex = 0;
  int qty = 0;
  TextEditingController txtQty = TextEditingController(text: '0');
  @override
  void initState() {
    super.initState();
    print(txtQty.text);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                            itemCount: 3,
                            options: CarouselOptions(
                              autoPlay: false,
                              autoPlayAnimationDuration: Duration(seconds: 2),
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              aspectRatio: 2 / 2,
                              initialPage: 0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentPageIndex = index.toDouble();
                                });
                              },
                            ),
                            itemBuilder: (context, index) => Container(
                                  decoration:
                                      BoxDecoration(boxShadow: darkShadow),
                                  child: images[index],
                                )),
                        Container(
                          child: DotsIndicator(
                            dotsCount: images.length,
                            position: _currentPageIndex,
                            decorator: DotsDecorator(
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeColor: colorPrimary,
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Sepatu Old School",
                          style: TextStyle(
                              color: colorPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Rp 120.000,00",
                          style: TextStyle(
                              color: colorSecondary,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Column(
                          children: [
                            Text(
                              "Size",
                              style: TextStyle(
                                  color: Colors.blueGrey[200],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                child: CustomRadioButton(
                                  enableButtonWrap: true,
                                  unSelectedColor: Colors.white,
                                  unSelectedBorderColor: Colors.white,
                                  enableShape: true,
                                  buttonLables: ["S", "M", "L", "XL"],
                                  buttonValues: ["S", "M", "L", "XL"],
                                  radioButtonValue: (value) {
                                    print(value);
                                  },
                                  selectedColor: colorPrimary,
                                  selectedBorderColor: colorPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Quantity",
                          style: TextStyle(
                              color: Colors.blueGrey[200],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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
                                  qty = int.parse(txtQty.text);
                                  if (qty > 0)
                                    setState(() {
                                      qty--;
                                      txtQty.value = TextEditingValue(
                                          text: qty.toString());
                                    });
                                }),
                            SizedBox(
                              child: Container(
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
                            ),
                            IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  print(txtQty.text);
                                  qty = int.parse(txtQty.text);
                                  setState(() {
                                    qty++;
                                    txtQty.value =
                                        TextEditingValue(text: qty.toString());
                                  });
                                })
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: colorPrimary, boxShadow: darkShadow),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 15),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                            // contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: "Search",
                            hintStyle:
                                TextStyle(color: colorPrimary.withOpacity(0.3)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.shoppingCart,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.shareAlt,
                        color: Colors.white,
                      ),
                      onPressed: () {})
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavItem(size: size),
    );
  }
}
