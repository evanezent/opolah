import 'package:flutter/material.dart';
import 'package:opolah/ui/components/profile/history_list.dart';
import 'package:opolah/ui/components/profile/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            PorfileHeader(size: size),
            SizedBox(height: 50),
            HistoryList(size: size)
          ],
        ),
      ),
    );
  }
}
