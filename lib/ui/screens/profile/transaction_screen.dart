import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/screens/profile/delivery_list_screen.dart';
import 'package:opolah/ui/screens/profile/payment_list_screen.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Transaction'),
        centerTitle: true,
        backgroundColor: colorPrimary,
        bottom: TabBar(tabs: [
          Tab(
            icon: FaIcon(FontAwesomeIcons.gift),
            text: 'Preparation',
          ),
          Tab(
            icon: FaIcon(FontAwesomeIcons.truck),
            text: 'Preparation',
          )
        ]),
      ),
      body: TabBarView(
        children: [PaymentList(), DeliveryList()],
      ),
    );
  }
}
