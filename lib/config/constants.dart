// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String imageDirectory = 'assets/images/';
const String imageURL = 'https://trustcollect.qrbdl.com/';
const String kBase64Extend = 'data:image/jpeg;base64,';
const String kBase64ExtendVideo = 'data:video/mp4;base64,';
const String kBase64ExtendAudio = 'data:audio/mp3;base64,';

const colorPrimary = Color(0xFFED3A69);
const colorSecondary1 = Color(0xFFF16086);
const colorSecondary2 = Color(0xFFFF0080);
const colorSecondary3 = Color(0xFFFAF1F5);
const colorSecondary4 = Color(0xFFFEECF0);
const colorWhite = Colors.white;
const colorBlack = Colors.black;
const colorBackground = Color(0xFFfefbfb);
const colorMute = Color(0xFFb3b3b3);

const colorDisable1 = Color(0xFF808080);
const colorDisable2 = Color(0xFFB4B4B4);
const colorDisable3 = Color(0xFF626262);
const colorDisable4 = Color(0xFFE3E3E3);
const colorDisable5 = Color(0xFFEEEFF0);

const colorError = Color(0xFFFF2424);
const colorSuccess = Color(0xFF2EB843);
const colorWarning = Color(0xFFF14705);
const colorInfo = Color(0xFFF9784F);

const colorYellow = Color(0xFFFFB100);

const colorBackgroundRed = Color.fromRGBO(237, 58, 105, 0.1);
const colorLink = Color(0xFF3759d3);

//FontWeight
const weight400 = FontWeight.w400;
const weight500 = FontWeight.w500;
const weight600 = FontWeight.w600;
const weight800 = FontWeight.w800;
const weightBold = FontWeight.bold;

//SizedBox Height
const height5 = SizedBox(height: 5);
const height8 = SizedBox(height: 8);
const height10 = SizedBox(height: 10);
const height15 = SizedBox(height: 15);
const height20 = SizedBox(height: 20);
const height25 = SizedBox(height: 25);
const height30 = SizedBox(height: 30);

//SizedBox Width
const width5 = SizedBox(width: 5);
const width8 = SizedBox(width: 8);
const width10 = SizedBox(width: 10);
const width15 = SizedBox(width: 15);
const width20 = SizedBox(width: 20);
const width30 = SizedBox(width: 30);

// Box Shadow
const primaryShadow = BoxShadow(blurRadius: 8, color: colorPrimary);
BoxShadow shadow1 =
    BoxShadow(blurRadius: 20, color: colorDisable4.withOpacity(0.4));
BoxShadow shadowInput =
    BoxShadow(blurRadius: 6, color: Color(0xFFE8D7D7).withOpacity(0.6));

//Axis Alignment
const crossAxisCenter = CrossAxisAlignment.center;
const crossAxisEnd = CrossAxisAlignment.end;
const crossAxisStart = CrossAxisAlignment.start;

const mainAxisCenter = MainAxisAlignment.center;
const mainAxisStart = MainAxisAlignment.start;
const mainAxisBetween = MainAxisAlignment.spaceBetween;
const mainAxisAround = MainAxisAlignment.spaceAround;
const mainAxisEnd = MainAxisAlignment.end;

BoxDecoration containerBoxDecoration(
    {double? borderRadius, Color? color, List<BoxShadow>? boxShadow}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius!),
    color: color,
    boxShadow: boxShadow,
  );
}

Border borderStandard = Border.all(color: Color.fromRGBO(0, 0, 0, .05));
BorderRadius radiusStandard = BorderRadius.circular(5);

// Form Errors
final RegExp regexEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const baseURI = "";
const apiVersion = "/api/v1/";
const fullBaseURI = "";
const storageWarisanPhoto = "";
const storageWarisan = "";
const storageWarisanPublic = "";
const apiKey = '';

// CONST FOR HEIGHT WIDGET
const heightAppBar = 50.0;
const heightInput = 42.0;

void progressDialog(BuildContext dialogContext) {
  //set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: colorPrimary,
          valueColor: AlwaysStoppedAnimation(colorWhite),
        ),
      ),
    ),
  );

  showDialog(
    //prevent outside touch
    barrierDismissible: false,
    context: dialogContext,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      dialogContext = context;
      //prevent Back button press
      return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: alert);
    },
  );
}

Widget primaryIndicator() {
  return Center(
    child: CircularProgressIndicator(
      backgroundColor: colorPrimary,
      valueColor: AlwaysStoppedAnimation(colorWhite),
    ),
  );
}

Widget refresherAndroid(Widget child,
    {Color loadingColor = colorWhite, required Function callbackReload}) {
  return RefreshIndicator(
    onRefresh: () => callbackReload(),
    color: loadingColor,
    child: child,
  );
}

Widget refresherIOS(Widget child, {required Function callbackReload}) {
  return CustomScrollView(
    slivers: [
      CupertinoSliverRefreshControl(
        onRefresh: () => callbackReload(),
      ),
      SliverToBoxAdapter(child: child)
    ],
  );
}