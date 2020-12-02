import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opolah/constant/constans.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEmailUsername = new TextEditingController();
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                // margin: EdgeInsets.only(top: 40, left: 20),
                child: Row(
                  children: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: Text("Log in",
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
                          Text('Shop now and start here !',
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      controller: textEmailUsername,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Email / No Hp',
                          hintStyle: TextStyle(color: Colors.white),
                          focusColor: Colors.white,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                    TextFormField(
                      controller: textPassword,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        child: Text("Forgot password",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16))),
                    SizedBox(height: 20),
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
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text("Your first time ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 17)),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: Text("Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
