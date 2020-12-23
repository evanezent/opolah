import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/user.dart';
import 'package:opolah/ui/screens/profile/transaction_screen.dart';

class PorfileHeader extends StatelessWidget {
  const PorfileHeader({
    Key key,
    @required this.size,
    this.user,
  }) : super(key: key);

  final Size size;
  final User user;

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
                user.image == ""
                    ? 'https://www.pngkit.com/png/full/301-3012694_account-user-profile-avatar-comments-fa-user-circle.png'
                    : user.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
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
                    user.name,
                    style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  SizedBox(height: 5),
                  Text(
                    user.phone,
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TransactionScreen(userID: user.id)));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.gift),
                            Text("Payments")
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TransactionScreen(tabIndex: 1)));
                        },
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
