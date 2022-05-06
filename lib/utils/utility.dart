import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
import 'package:opolah/config/constants.dart';

void initialization() async {
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
}

final listBulan = [
  "",
  "Jan",
  "Feb",
  "Maret",
  "April",
  "Mei",
  "Juni",
  "Juli",
  "Agustus",
  "Sep",
  "Okt",
  "Nov",
  "Des",
];

String translateDay(String day) {
  switch (day) {
    case "Sunday":
      return "Minggu";
      break;
    case "Monday":
      return "Senin";
      break;
    case "Tuesday":
      return "Selasa";
      break;
    case "Wednesday":
      return "Rabu";
      break;
    case "Thursday":
      return "Kamis";
      break;
    case "Friday":
      return "Jumat";
      break;
    case "Saturday":
      return "Sabtu";
      break;
    default:
      return "Senin";
      break;
  }
}

String formatDate(DateTime date) {
  String d = date.day > 9 ? "${date.day}" : "0${date.day}";
  String m = date.month > 9 ? "${date.month}" : "0${date.month}";

  return "${date.year}-$m-$d";
}

String formatYoutubeImage(String youtubeLink) {
  var link = youtubeLink.split("/");

  if (link.length == 3) {
    //FOR SHORT YOUTUBE LINK
    String data = "https://img.youtube.com/vi/" + link[2] + "/sddefault.jpg";
    return data;
  } else if (link.length == 4) {
    //FOR https://www.youtube.com/watch?v=(ID)
    var longLink = link[3].split("=");
    String data =
        "https://img.youtube.com/vi/" + longLink[1] + "/sddefault.jpg";
    return data;
  } else {
    // for  https://youtube.com/embed/id
    String data = "https://img.youtube.com/vi/" + link[4] + "/sddefault.jpg";
    return data;
  }
}

void goto(StatefulWidget tujuan, context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => tujuan));
}

String returnBank(String bank) {
  String asset = 'assets/images/komisi/payments/';
  String myBank = bank.toLowerCase();
  if (myBank.contains("bca")) {
    return asset + 'VA_BCA.png';
  } else if (myBank.contains("bni")) {
    return asset + 'VA_BNI.png';
  } else if (myBank.contains("bri")) {
    return asset + 'VA_BRI.png';
  } else if (myBank.contains("cimb")) {
    return asset + 'VA_CIMB.png';
  } else if (myBank.contains("nandiri")) {
    return asset + 'VA_MANDIRI.png';
  } else if (myBank.contains("muamalat")) {
    return asset + 'VA_MUAMALAT.png';
  } else if (myBank.contains("permata")) {
    return asset + 'VA_PERMATA.png';
  } else if (myBank.contains("ovo")) {
    return asset + 'ovo.png';
  } else if (myBank.contains("shopee")) {
    return asset + 'shopeepay.png';
  } else {
    return asset + 'bank_icon.png';
  }
}

String returnBankName(String bank) {
  String myBank = bank.toLowerCase();
  if (myBank.contains("bca")) {
    return "BCA Virtual Account";
  } else if (myBank.contains("bni")) {
    return "BNI Virtual Account";
  } else if (myBank.contains("bri")) {
    return "BRI Virtual Account";
  } else if (myBank.contains("cimb")) {
    return "CIMB Virtual Account";
  } else if (myBank.contains("mandiri")) {
    return "Bank Mandiri Virtual Account";
  } else if (myBank.contains("muamalat")) {
    return "Bank Muamalat Virtual Account";
  } else if (myBank.contains("permata")) {
    return "Bank Permata Virtual Account";
  } else if (myBank.contains("ovo")) {
    return "OVO E-WALLET";
  } else if (myBank.contains("shopee")) {
    return "ShopeePay";
  } else if (myBank.contains("qris")) {
    return "qris";
  } else {
    return bank;
  }
}

// String formatterRupiah(int price) {
//   final oCcy = NumberFormat("#,##0", "en_US");
//   return oCcy.format(price);
// }

String linkOfImg(String? link) {
  if (link != null && link != "") {
    if (link.contains("https:")) {
      return link;
    } else if (link.contains("upload")) {
      return storageWarisan + link;
    } else {
      return "https://api.warisan.co.id/storage/photo/" + link;
    }
  } else {
    return 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png';
  }
}

Widget waitingWidget({double value = 100}) {
  return SizedBox(
    height: value,
    width: value,
    child: const Center(
      child: CircularProgressIndicator(
        color: colorPrimary,
        backgroundColor: colorBackgroundRed,
        strokeWidth: 3,
      ),
    ),
  );
}


// String formatDateDayID(String date) {
//   String tanggal = "";
//   DateTime dt = DateTime.parse(date);

//   String dayname = translateDay(DateFormat('EEEE').format(dt));
//   String day = dt.day <= 9 ? "0${dt.day}" : "${dt.day}";
//   String month = listBulan[dt.month];
//   String year = "${dt.year}";

//   tanggal = "$dayname, $day $month $year";

//   return tanggal;
// }

String formatDateID(String date) {
  String tanggal = "";
  DateTime dt = DateTime.parse(date);

  String day = dt.day <= 9 ? "0${dt.day}" : "${dt.day}";
  String month = listBulan[dt.month];
  String year = "${dt.year}";

  tanggal = "$day $month $year";

  return tanggal;
}

String formatTime(String date) {
  String time = "";
  DateTime dt = DateTime.parse(date);

  String hour = dt.hour <= 9 ? "0${dt.hour}" : "${dt.hour}";
  String minutes = dt.minute <= 9 ? "0${dt.minute}" : "${dt.minute}";

  time = "$hour : $minutes ";

  return time;
}

Future<XFile?> pickImageFromCamera() async {
  XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 300,
      maxWidth: 300,
      imageQuality: 80);

  return image;
}

Future<XFile?> pickImageFromGallery() async {
  XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 300,
      maxWidth: 300,
      imageQuality: 80);

  return image;
}

bool emailValidator(String email) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  print(emailValid);
  return emailValid;
}

Widget smartRefresh(
    {required Widget child,
    Color loadingColor = colorPrimary,
    required Function onRefresh}) {
  if (Platform.isAndroid) {
    return refresherAndroid(child,
        loadingColor: loadingColor, callbackReload: onRefresh);
  } else {
    return refresherIOS(child, callbackReload: onRefresh);
  }
}
