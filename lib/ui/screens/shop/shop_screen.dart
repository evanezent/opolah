import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/ui/components/card_item.dart';
import 'package:opolah/ui/components/home/search_bar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key key, this.itemList}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
  final List<Item> itemList;
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            widget.itemList.length == 0
                ? Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation(colorPrimary),
                    ),
                )
                : Container(
                    margin: EdgeInsets.only(top: 60),
                    child: StaggeredGridView.countBuilder(
                        itemCount: widget.itemList.length,
                        crossAxisCount: 2,
                        itemBuilder: (context, index) {
                          return CardItem(
                            item: widget.itemList[index],
                            size: size,
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
