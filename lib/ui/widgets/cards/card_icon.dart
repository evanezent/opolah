import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/config/constants.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);

  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: 65,
          height: 65,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset.zero,
                    blurRadius: 6,
                    color: colorBlack.withOpacity(0.2))
              ]),
          child: Column(
            children: [
              FaIcon(
                icon,
                color: colorPrimary,
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                ),
              )
            ],
          )),
    );
  }
}
