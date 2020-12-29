import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:opolah/blocs/item/item_bloc.dart';
import 'package:opolah/blocs/item/item_state.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/item.dart';
import 'package:opolah/ui/components/card_item.dart';
import 'package:opolah/ui/components/home/search_bar.dart';

class ShopScreen extends StatefulWidget {
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
            BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                if (state is ItemsLoading) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(colorPrimary),
                  ));
                } else if (state is ItemsLoaded) {
                  final items = state.itemList;
                  return Container(
                      margin: EdgeInsets.only(top: 60),
                      child: StaggeredGridView.countBuilder(
                          itemCount: items.length,
                          crossAxisCount: 2,
                          itemBuilder: (context, index) {
                            return CardItem(
                              item: items[index],
                              size: size,
                            );
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(1)));
                }
                return Container();
              },
            ),
            SearchBar(),
          ],
        ),
      ),
    );
  }
}
