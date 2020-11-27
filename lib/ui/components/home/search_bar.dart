import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: TextField(
                style: TextStyle(fontSize: 15),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintText: "Search",
                    hintStyle: TextStyle(color: colorPrimary.withOpacity(0.3)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.solidEnvelope,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.solidBell,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
