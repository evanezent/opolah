import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/ui/components/card_item.dart';
import 'package:opolah/ui/components/see_all.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key key,
    @required this.size,
    this.title,
    this.openMore,
    this.listItem,
  }) : super(key: key);

  final Size size;
  final String title;
  final Function openMore;
  final List<Item> listItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SeeAll(title: title, openMore: openMore),
          listItem.length == 0
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(colorPrimary),
                )
              : Container(
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => CardItem(
                      size: size,
                      item: listItem[index],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
