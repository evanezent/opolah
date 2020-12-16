import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key key,
    @required this.size,
    this.choose,
    this.onChoose,
    this.name,
    this.address,
    this.phone,
  }) : super(key: key);

  final Size size;
  final bool choose;
  final Function onChoose;
  final String name, address, phone;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChoose,
      child: Container(
        width: size.width * 0.6,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: colorPrimary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: darkShadow),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.5,
              child: Text(name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            Text('( ${phone} )',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14)),
            SizedBox(height: 8),
            Container(
              height: 50,
              child: Text(address,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14)),
            ),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  choose
                      ? FaIcon(FontAwesomeIcons.solidCheckCircle,
                          color: Colors.white)
                      : FaIcon(FontAwesomeIcons.solidCircle,
                          color: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
