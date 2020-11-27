import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/components/CardItem.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key key,
    @required this.size,
    this.title,
    this.openMore,
  }) : super(key: key);

  final Size size;
  final String title;
  final Function openMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
              InkWell(
                onTap: openMore,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorPrimary,
                  ),
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardItem(
                  size: size,
                  imgUrl:
                      'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
                  nStar: 5,
                  name: 'Space-Star Art Tshirt',
                  price: '75.000',
                ),
                CardItem(
                  size: size,
                  imgUrl:
                      'https://i.ebayimg.com/images/i/252607971933-0-1/s-l1000.jpg',
                  nStar: 4.5,
                  name: 'Uzi Japan Sweater',
                  price: '275.000',
                ),
                CardItem(
                  size: size,
                  imgUrl:
                      'https://vipoutlet.com/contents/uploads/2019/06/127c9c3e0158474591a0c2a79d2d65eb.jpg',
                  nStar: 5,
                  name: 'Oddgod A1-Blue',
                  price: '500.000',
                ),
                CardItem(
                  size: size,
                  imgUrl:
                      'https://ssl.quiksilver.com/www/store.quiksilver.eu/html/images/catalogs/global/dcshoes-products/all/default/hi-res/adys100319_plazatcs,p_bda_frt1.jpg',
                  nStar: 4.8,
                  name: 'DC-Shoes Shielder',
                  price: '347.000',
                ),
                CardItem(
                  size: size,
                  imgUrl:
                      'https://cdn.cultofmac.com/wp-content/uploads/2019/07/iPhone-11R-11Max-Fence.jpg',
                  nStar: 5,
                  name: 'Iphone 11 PRO',
                  price: '10.755.000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
