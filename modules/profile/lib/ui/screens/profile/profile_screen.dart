import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart'; 
import 'package:opolah/config/constants.dart';
import 'package:profile/models/user.dart';
import 'package:profile/ui/widgets/history_list.dart';
import 'package:profile/ui/widgets/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  PorfileHeader(size: size),
                  const SizedBox(height: 50),
                  HistoryList(
                    size: size,
                  )
                ],
              ),
            ),
            CircularMenu(
              toggleButtonColor: colorPrimary,
              alignment: Alignment.bottomRight,
              startingAngleInRadian: 3.35,
              endingAngleInRadian: 4.35,
              items: [
                CircularMenuItem(
                  icon: Icons.logout,
                  onTap: () async {
                    // final prefs = await SharedPreferences.getInstance();
                    // prefs.remove('userID');
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => LoginScreen()));
                  },
                  color: colorSecondary1,
                  iconColor: Colors.white,
                ),
                CircularMenuItem(
                  icon: Icons.settings,
                  onTap: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //     builder: (context) =>
                    //         EditProfile(currentUser: state.profileList)));
                  },
                  color: colorPrimary,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ],
        ));
  }
}
