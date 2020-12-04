import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:opolah/ui/components/card_item.dart';
import 'package:opolah/ui/components/home/search_bar.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: StaggeredGridView.countBuilder(
                  itemCount: 10,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    return CardItem(
                      size: size,
                      imgUrl:
                          'https://ae01.alicdn.com/kf/HTB1mF5aKFXXXXbOXFXXq6xXFXXXk/2-colors-2014-summer-mens-quick-dry-shirts-original-design-boys-cool-t-shirt-free-shipping.jpg',
                      nStar: 5,
                      name: 'Space-Star Art Tshirt',
                      price: '75.000',
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.fit(1)),
            ),
            SearchBar(),
          ],
        ),
      ),
    );
  }
}
