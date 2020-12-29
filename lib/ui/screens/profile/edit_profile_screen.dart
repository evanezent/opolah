import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opolah/blocs/profile/profile_bloc.dart';
import 'package:opolah/blocs/profile/profile_event.dart';
import 'package:opolah/constant/constans.dart';
import 'package:opolah/constant/utils.dart';
import 'package:opolah/models/user.dart';
import 'package:opolah/repositories/user_repo.dart';
import 'package:opolah/ui/screens/main_screen.dart';

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

  Utils util = Utils();
  DataRepository repository = DataRepository();
  String imgUrl;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });

        var data = repository.uploadImage(_image);

        data.then((value) {
          if (value != "") {
            util.successToast("Image Updated !");
            print("IMAGE UPDATED !!! $value");
            setState(() {
              imgUrl = value;
            });
          } else {
            util.errorToast("Failed to update Image !");
          }
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
        appBar: AppBar(
          title: Text('MY PROFILE'),
          centerTitle: true,
          backgroundColor: colorPrimary,
        ),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 30),
              InkWell(
                onTap: getImage,
                child: Column(
                  children: [
                    Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          boxShadow: wideShadow,
                          color: Colors.grey[200],
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: _image == null
                            ? Image.network(
                                widget.currentUser.image == "" ||
                                        widget.currentUser.image == null
                                    ? 'https://www.pngkit.com/png/full/301-3012694_account-user-profile-avatar-comments-fa-user-circle.png'
                                    : widget.currentUser.image,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                _image,
                                fit: BoxFit.cover,
                              )),
                    SizedBox(height: 10),
                    Text(
                      "Change Image",
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
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
                            color: colorPrimary,
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
                          labelStyle: TextStyle(color: colorPrimary),
                          hintText: 'Name',
                          hintStyle: TextStyle(color: colorPrimary),
                          focusColor: colorPrimary,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: textEmail,
                        style: TextStyle(
                            color: colorPrimary,
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
                          labelStyle: TextStyle(color: colorPrimary),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: colorPrimary),
                          focusColor: colorPrimary,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: textPhone,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        style: TextStyle(
                            color: colorPrimary,
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
                          labelStyle: TextStyle(color: colorPrimary),
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: colorPrimary),
                          focusColor: colorPrimary,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              RaisedButton(
                  onPressed: () async {
                    print(imgUrl);
                    User user = User.withId(
                        widget.currentUser.id,
                        textName.text,
                        textEmail.text,
                        imgUrl,
                        widget.currentUser.password,
                        textPhone.text);
                    BlocProvider.of<UserBloc>(context).add(UpdateUser(user));
                    var res = await repository.updateUser(user);

                    if (res) {
                      util.successToast("Profile updated !");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainScreen(currentPageIndex: 3)));
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(500)),
                  color: colorPrimary,
                  child: Container(
                    width: 300,
                    height: 50,
                    child: Center(
                      child: Text(
                        "UPDATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
