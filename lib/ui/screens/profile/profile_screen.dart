import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/transaction.dart';
import 'package:opolah/models/user.dart';
import 'package:opolah/repositories/transaction_repo.dart';
import 'package:opolah/ui/components/profile/history_list.dart';
import 'package:opolah/ui/components/profile/profile_header.dart';
import 'package:opolah/ui/screens/profile/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key, this.activeUser}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
  final User activeUser;
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
      body: widget.activeUser == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation(colorPrimary),
              ),
            )
          : Stack(
              children: [
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        PorfileHeader(size: size, user: widget.activeUser),
                        SizedBox(height: 50),
                        HistoryList(
                          size: size,
                          historyList: historyList,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: CircularMenu(
                    toggleButtonColor: colorPrimary,
                    alignment: Alignment.bottomRight,
                    startingAngleInRadian: 3.35,
                    endingAngleInRadian: 4.35,
                    items: [
                      CircularMenuItem(
                        icon: Icons.logout,
                        onTap: () {},
                        color: colorSecondary,
                        iconColor: Colors.white,
                      ),
                      CircularMenuItem(
                        icon: Icons.settings,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                      currentUser: widget.activeUser)));
                        },
                        color: colorPrimary,
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
