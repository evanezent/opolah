import 'package:flutter/material.dart';
import 'package:opolah/config/constants.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({
    Key? key,
    required this.title,
    required this.openMore,
  }) : super(key: key);

  final String title;
  final Function openMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: colorPrimary, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        InkWell(
          onTap: () => openMore,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorPrimary,
            ),
            child: const Text(
              "See all",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ),
        )
      ],
    );
  }
}
