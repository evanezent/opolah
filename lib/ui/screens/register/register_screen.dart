import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/ui/screens/login/login_screen.dart';

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
                Container(
                  margin: EdgeInsets.only(top: 50, left: 20),
                  child: Row(
                    children: [
                      RotatedBox(
                          quarterTurns: 3,
                          child: Text("Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60))),
                      SizedBox(width: 20),
                      Container(
                        width: size.width * 0.7,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('You can start something new !',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 36)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        onPressed: () {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: Container(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Ok",
                                  style: TextStyle(
                                      color: colorPrimary,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20)),
                              SizedBox(width: 10),
                              FaIcon(
                                FontAwesomeIcons.longArrowAltRight,
                                color: colorPrimary,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Text("Have an account ?",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 17)),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text("Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
