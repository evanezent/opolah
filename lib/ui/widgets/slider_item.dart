import 'package:flutter/material.dart';
import 'package:opolah/config/constants.dart';
import 'package:opolah/helper/models.dart';
import 'package:opolah/ui/widgets/cards/card_item.dart';
import 'package:opolah/ui/widgets/see_all.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.size,
    required this.title,
    this.openMore,
    this.listItem,
  }) : super(key: key);

  final Size size;
  final String title;
  final Function? openMore;
  final List<Item>? listItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SeeAll(title: title, openMore: () => openMore),
          listItem == null
              ? const Text("Empty data!")
              : listItem!.isEmpty
                  ? const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation(colorPrimary),
                    )
                  : Container(
                      height: 270,
                      margin: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => CardItem(
                          size: size,
                          item: listItem![index],
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}