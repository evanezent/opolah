import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class PorfileHeader extends StatelessWidget {
  const PorfileHeader({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.5 - 80,
            child: Container(
              child: Image.network(
                'https://i.pinimg.com/originals/05/fb/f7/05fbf776879f1ad6016427a34d2cd6e5.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              right: 10,
              top: 20,
              child: Container(
                decoration: BoxDecoration(boxShadow: wideShadow),
                child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.solidEdit,
                      color: Colors.white60,
                      size: 30,
                    ),
                    onPressed: () {}),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 70),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: wideShadow),
              child: Column(
                children: [
                  Text(
                    "Takanori Iwata",
                    style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "081982322775",
                    style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                  Container(
                    height: 0.6,
                    color: colorPrimary,
                    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.gift),
                            Text("Preparation")
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.truck),
                            Text("Delivery")
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
