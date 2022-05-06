import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile/models/user.dart';
import 'package:opolah/config/constants.dart';

class PorfileHeader extends StatelessWidget {
  const PorfileHeader({
    Key? key,
    required this.size,
    this.user,
  }) : super(key: key);

  final Size size;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.5 - 80,
            child: Image.network(
              user == null
                  ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png'
                  : user?.image == "" || user?.image == null
                      ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png'
                      : user!.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 70),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [shadowWide]),
              child: Column(
                children: [
                  Text(
                    user == null ? "User name" : user!.name,
                    style: const TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  height5,
                  Text(
                    user == null ? "-" : user!.phone,
                    style: const TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                  Container(
                    height: 0.6,
                    color: colorPrimary,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             TransactionScreen(userID: user.id)));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(FontAwesomeIcons.gift),
                            Text("Payments")
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => TransactionScreen(
                          //             tabIndex: 1, userID: user.id)));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
