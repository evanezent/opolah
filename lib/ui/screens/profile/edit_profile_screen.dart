import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/models/user.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key, this.currentUser}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();

  final User currentUser;
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController textName = new TextEditingController();
  TextEditingController textEmail = new TextEditingController();
  TextEditingController textPhone = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  bool _autoValidate = false;
  bool loading = false;
  File _image;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    textName = new TextEditingController(text: widget.currentUser.name);
    textEmail = new TextEditingController(text: widget.currentUser.email);
    textPhone = new TextEditingController(text: widget.currentUser.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.white,
                  colorPrimary,
                  colorPrimary,
                ])),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                InkWell(
                  onTap: getImage,
                  child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _image == null
                          ? Image.network(widget.currentUser.image == ""
                              ? 'https://www.pngkit.com/png/full/301-3012694_account-user-profile-avatar-comments-fa-user-circle.png'
                              : widget.currentUser.image)
                          : Image.file(_image)),
                ),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
