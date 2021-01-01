import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/blocs/cart/cart_bloc.dart';
import 'package:opolah/blocs/cart/cart_event.dart';
import 'package:opolah/blocs/cart/cart_state.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/models/cart.dart';
import 'package:opolah/models/item-type.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/repositories/item_type_repo.dart';
import 'package:opolah/ui/components/shop/bottom_nav_item.dart';
import 'package:opolah/ui/screens/main_screen.dart';
import 'package:opolah/ui/screens/shipping/shipping_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailItem extends StatefulWidget {
  const DetailItem({Key key, this.item}) : super(key: key);

  @override
  _DetailItemState createState() => _DetailItemState();
  final Item item;
}

class _DetailItemState extends State<DetailItem> {
  void getItemTypes() async {
    var data = _itemTypeRepository.getItemType(widget.item.getID);

    await data.then((value) {
      setState(() {
        typeList = value;
      });
    });

    buildTypeChooser();
  }

  void buildCardSlider() {
    setState(() {
      images.add(
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          child: Image.network(
            widget.item.getImage,
            fit: BoxFit.cover,
          ),
        ),
      );
      _currentPageIndex = 0;
    });
  }

  void getActiveUser() async {
    var prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("userID");

    if (id != null) {
      setState(() {
        userID = id;
      });
    }
  }

  void buildTypeChooser() {
    List<String> temp = [];
    typeList.forEach((element) {
      temp.add(element.getValue);
    });

    temp.sort();
    setState(() {
      types = temp;
      //Get Title
      type = typeList[0].getName;
    });
  }

  void addtoCart() async {
    Cart cart = Cart(
        widget.item.getID, userID, choosedType, qty.toString(), widget.item);
    BlocProvider.of<CartBloc>(context).add(AddCart(cart));
  }

  void checkout() {
    Cart cart = Cart(
        widget.item.getID, userID, choosedType, qty.toString(), widget.item);

    int totalPrice = widget.item.getPrice.toInt() * qty;

    if (qty > 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ShippingScreen(choosen: [cart], totalItemPrice: totalPrice)));
    }
  }

  ItemTypeRepository _itemTypeRepository = ItemTypeRepository();
  List<ItemType> typeList = [];
  List<String> types = [];
  Utils util = Utils();
  List images = [];
  String userID;

  int qty = 0;
  String type;
  String choosedType;
  double _currentPageIndex;
  bool lessThanZero = false;
  TextEditingController txtQty = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    getActiveUser();
    getItemTypes();
    buildCardSlider();
  }

  @override
  Widget build(BuildContext context) {
    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: widget.item.getPrice);

    Size size = MediaQuery.of(context).size;
    return BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is SuccessAdd) {
            util.successToast("Successfully added !");
          } else if (state is FailAdd) {
            util.errorToast("Something error when add !");
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) => Scaffold(
                  backgroundColor: Colors.grey[200],
                  body: SafeArea(
                    child: Stack(
                      children: [
                        typeList.length == 0
                            ? Center(
                                child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor:
                                    AlwaysStoppedAnimation(colorPrimary),
                              ))
                            : Container(
                                margin: EdgeInsets.only(top: 50),
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Column(
                                        children: [
                                          CarouselSlider.builder(
                                              itemCount: images.length,
                                              options: CarouselOptions(
                                                autoPlay: false,
                                                autoPlayAnimationDuration:
                                                    Duration(seconds: 2),
                                                enlargeCenterPage: true,
                                                viewportFraction: 0.9,
                                                aspectRatio: 1,
                                                initialPage: 0,
                                                onPageChanged: (index, reason) {
                                                  setState(() {
                                                    _currentPageIndex =
                                                        index.toDouble();
                                                  });
                                                },
                                              ),
                                              itemBuilder: (context, index) =>
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: darkShadow,
                                                      color: Colors.white,
                                                    ),
                                                    child: images[index],
                                                  )),
                                          Container(
                                            child: DotsIndicator(
                                              dotsCount: images.length,
                                              position: _currentPageIndex,
                                              decorator: DotsDecorator(
                                                size: const Size.square(9.0),
                                                activeSize:
                                                    const Size(18.0, 9.0),
                                                activeColor: colorPrimary,
                                                activeShape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          Text(
                                            widget.item.getName,
                                            style: TextStyle(
                                                color: colorPrimary,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            "RP ${fmf.output.nonSymbol}",
                                            style: TextStyle(
                                                color: colorSecondary,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 30),
                                          Column(
                                            children: [
                                              Text(
                                                type,
                                                style: TextStyle(
                                                    color: Colors.blueGrey[200],
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Container(
                                                  child: CustomRadioButton(
                                                    enableButtonWrap: true,
                                                    unSelectedColor:
                                                        Colors.white,
                                                    unSelectedBorderColor:
                                                        Colors.white,
                                                    enableShape: true,
                                                    buttonLables: types,
                                                    buttonValues: types,
                                                    radioButtonValue: (value) {
                                                      setState(() {
                                                        choosedType = value;
                                                      });
                                                    },
                                                    selectedColor: colorPrimary,
                                                    selectedBorderColor:
                                                        colorPrimary,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.minus,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    qty =
                                                        int.parse(txtQty.text);
                                                    if (qty > 0)
                                                      setState(() {
                                                        qty--;
                                                        txtQty.value =
                                                            TextEditingValue(
                                                                text: qty
                                                                    .toString());
                                                      });
                                                  }),
                                              SizedBox(
                                                child: Container(
                                                  width: 30,
                                                  child: TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textAlign: TextAlign.center,
                                                    controller: txtQty,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp("[0-9]")),
                                                    ],
                                                    decoration: InputDecoration(
                                                      hintStyle: TextStyle(
                                                          color: colorPrimary
                                                              .withOpacity(
                                                                  0.3)),
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
                                                    qty =
                                                        int.parse(txtQty.text);
                                                    setState(() {
                                                      qty++;
                                                      txtQty.value =
                                                          TextEditingValue(
                                                              text: qty
                                                                  .toString());
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
                          decoration: BoxDecoration(
                              color: colorPrimary, boxShadow: darkShadow),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        qty = int.parse(value);
                                      });
                                    },
                                    decoration: InputDecoration(
                                        errorStyle:
                                            TextStyle(color: colorSecondary),
                                        hintText: "Search",
                                        hintStyle: TextStyle(
                                            color:
                                                colorPrimary.withOpacity(0.3)),
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
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainScreen(
                                                currentPageIndex: 2)));
                                  }),
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
                  bottomNavigationBar: BottomNavItem(
                      size: size,
                      callbackBuy: checkout,
                      callbackCart: () {
                        if (qty <= 0) {
                          util.errorToast("Minimum value is bigger than 0 !");
                        } else if (choosedType == null) {
                          util.errorToast("Please choose type !");
                        } else {
                          addtoCart();
                          util.successToast("Added to Cart !");
                        }
                      }),
                )));
    //
  }
}
