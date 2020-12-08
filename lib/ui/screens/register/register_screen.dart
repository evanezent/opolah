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
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(
        title,
        style: TextStyle(
            color: colorSecondary, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: Text(
        message,
        style: TextStyle(
            color: colorSecondary, fontSize: 15, fontWeight: FontWeight.w400),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void register() {
    if (_formKey.currentState.validate()) {
      User newUser = User(
          textName.text, textEmail.text, textPassword.text, textPhone.text);

      var res = repository.registerUser(newUser);
      res.then((value) {
        if (value == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        } else {
          _showAlertDialog('Failed !', "Email or Phone number has been exists");
          setState(() {
            this.loading = false;
          });
        }
      });
    } else {
      setState(() {
        this.loading = false;
        _autoValidate = true;
      });
    }
  }

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
                Form(
                  autovalidate: _autoValidate,
                  key: _formKey,
                  child: Container(
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
                          validator: (value) {
                            if (value.length < 6)
                              return "Name is too short";
                            else
                              return null;
                          },
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
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);

                            if (!regex.hasMatch(val))
                              return "Email doesn't valid";
                            else if (val.length < 7)
                              return "Email doesn't valid";
                            else
                              return null;
                          },
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
                          validator: (value) {
                            if (value.length < 9)
                              return "Phone number doesn't valid";
                            else
                              return null;
                          },
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
                          validator: (value) {
                            if (value.length < 6)
                              return "Password is too short";
                            else
                              return null;
                          },
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
                ),
                SizedBox(height: 30),
                ButtonOk(
                    size: size,
                    onClick: () {
                      setState(() {
                        this.loading = true;
                      });
                      register();
                    },
                    isLoading: loading),
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
