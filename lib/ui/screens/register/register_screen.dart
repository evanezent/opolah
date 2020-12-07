import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/user.dart';
import 'package:opolah/repositories/user_repo.dart';
import 'package:opolah/ui/components/login-register/button_ok.dart';
import 'package:opolah/ui/components/login-register/change_login_register.dart';
import 'package:opolah/ui/components/login-register/header.dart';
import 'package:opolah/ui/screens/login/login_screen.dart';
import 'package:opolah/ui/screens/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController textName = new TextEditingController();
  TextEditingController textEmail = new TextEditingController();
  TextEditingController textPhone = new TextEditingController();
  TextEditingController textPassword = new TextEditingController();
  bool _obscureText = true;

  DataRepository repository = DataRepository();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  colorSecondary,
                  colorPrimary,
                  colorPrimary,
                ])),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                HeaderLoginRegister(
                    size: size,
                    title: 'Register',
                    word: 'You can start something new !'),
                SizedBox(height: 60),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textName,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Colors.white),
                            focusColor: Colors.white,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: textEmail,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            focusColor: Colors.white,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: textPhone,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(color: Colors.white),
                            focusColor: Colors.white,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: textPassword,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            focusColor: Colors.white,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: FaIcon(
                                _obscureText
                                    ? FontAwesomeIcons.solidEye
                                    : FontAwesomeIcons.eye,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ButtonOk(
                    size: size,
                    onClick: () {
                      User newUser = User(textName.text, textEmail.text,
                          textPhone.text, textPassword.text);
                      repository.registerUser(newUser);
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MainScreen()));
                    }),
                SizedBox(height: 50),
                ChangePageLoginRegister(
                  question: 'Have an account ?',
                  change: 'Login',
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
