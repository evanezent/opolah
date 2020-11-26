import 'package:flutter/material.dart';

const colorPrimary = Color(0xFF293658);
const colorSecondary = Color(0xFFEB3F4E);
const colorBackup = Color(0xFF422A42);

List<BoxShadow> darkShadow = [
  BoxShadow(
    color: colorPrimary,
    offset: Offset(0, 0),
    blurRadius: 6
  )
];

List<BoxShadow> navShadow = [
  BoxShadow(
      color: Colors.white38,
      offset: Offset(0, 0),
      blurRadius: 5,)
];