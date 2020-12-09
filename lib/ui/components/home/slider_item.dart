import 'package:flutter/material.dart';
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
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => CardItem(
                size: size,
                item: listItem[index],
              ),
              // child: Row(
              //   children: [
              //     CardItem(
              //       size: size,
              //       imgUrl:
              //           'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
              //       nStar: 5,
              //       name: 'Space-Star Art Tshirt',
              //       price: 75000,
              //     ),
              //     CardItem(
              //       size: size,
              //       imgUrl:
              //           'https://i.ebayimg.com/images/i/252607971933-0-1/s-l1000.jpg',
              //       nStar: 4.5,
              //       name: 'Uzi Japan Sweater',
              //       price: 275000,
              //     ),
              //     CardItem(
              //       size: size,
              //       imgUrl:
              //           'https://vipoutlet.com/contents/uploads/2019/06/127c9c3e0158474591a0c2a79d2d65eb.jpg',
              //       nStar: 5,
              //       name: 'Oddgod A1-Blue',
              //       price: 500000,
              //     ),
              //     CardItem(
              //       size: size,
              //       imgUrl:
              //           'https://ssl.quiksilver.com/www/store.quiksilver.eu/html/images/catalogs/global/dcshoes-products/all/default/hi-res/adys100319_plazatcs,p_bda_frt1.jpg',
              //       nStar: 4.8,
              //       name: 'DC-Shoes Shielder',
              //       price: 347000,
              //     ),
              //     CardItem(
              //       size: size,
              //       imgUrl:
              //           'https://cdn.cultofmac.com/wp-content/uploads/2019/07/iPhone-11R-11Max-Fence.jpg',
              //       nStar: 5,
              //       name: 'Iphone 11 PRO',
              //       price: 10755000,
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
