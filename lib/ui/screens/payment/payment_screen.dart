import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/payment_card.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PageController _controller;

  // _goToDetail(Character character) {
  //   final page = DetailPage(character: character);
  //   Navigator.of(context).push(
  //     PageRouteBuilder<Null>(
  //         pageBuilder: (BuildContext context, Animation<double> animation,
  //             Animation<double> secondaryAnimation) {
  //           return AnimatedBuilder(
  //               animation: animation,
  //               builder: (BuildContext context, Widget child) {
  //                 return Opacity(
  //                   opacity: animation.value,
  //                   child: page,
  //                 );
  //               });
  //         },
  //         transitionDuration: Duration(milliseconds: 400)),
  //   );
  // }

  _pageListener() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(viewportFraction: 0.6);
    _controller.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_pageListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dragon Ball"),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            controller: _controller,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              double currentPage = 0;
              // try {
              //   currentPage = _controller.page;
              // } catch (_) {}

              // final resizeFactor =
              //     (1 - (((currentPage - index).abs() * 0.3).clamp(0.0, 1.0)));
              final currentCharacter = cards[index];
              return ListItem(
                character: currentCharacter,
                onTap: () {},
              );
            }),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final PaymentCard character;
  final VoidCallback onTap;

  const ListItem({
    Key key,
    @required this.character,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          // height: 200,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Hero(
                tag: "background_${character.title}",
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white, boxShadow: darkShadow),
                    child: Column(
                      children: [
                        Container(
                          child: Image.network(
                            character.image,
                            height: 200,
                          ),
                        ),
                        // Container(
                        //   alignment: Alignment.bottomLeft,
                        //   margin: EdgeInsets.only(
                        //     left: 20,
                        //     bottom: 10,
                        //   ),
                        //   child: Text(
                        //     character.title,
                        //     style: TextStyle(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
