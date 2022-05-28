import 'package:flutter/material.dart';
import 'package:opolah/helper/dummy_data.dart';
import 'package:opolah/helper/library.dart';
import 'package:opolah/ui/widgets/search_bar.dart';
import 'package:opolah/ui/widgets/cards/card_item.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
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
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 70),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  children: [
                    ...dummyItem!.map((item) => CardItem(
                          item: item,
                          size: size,
                        ))
                  ],
                ),
              ),
            ),
            const SearchBar(),
          ],
        ),
      ),
    );
  }
}
