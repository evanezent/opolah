import 'package:flutter/material.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/repositories/transaction_repo.dart';
import 'package:opolah/ui/components/profile/history_list.dart';
import 'package:opolah/ui/components/profile/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<TransactionClass> historyList = [];
  TransactionRepository _transactionRepository = TransactionRepository();

  void getAllHistory() async {
    var data = await _transactionRepository.getStream();

    for (var transaction in data) {
      if (transaction.getStatus) {
        setState(() {
          historyList.add(transaction);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAllHistory();
  }

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
            HistoryList(
              size: size,
              historyList: historyList,
            )
          ],
        ),
      ),
    );
  }
}
