import 'package:flutter/material.dart';

const colorPrimary = Color(0xFF293658);
const colorSecondary = Color(0xFFEB3F4E);
const colorBackup = Color(0xFF422A42);

List<BoxShadow> darkShadow = [
  BoxShadow(color: colorPrimary, offset: Offset(0, 0), blurRadius: 6)
];

List<BoxShadow> bottomDarkShadow = [
  BoxShadow(color: colorPrimary, offset: Offset(0, 5), blurRadius: 6)
];

List<BoxShadow> wideShadow = [
  BoxShadow(
    color: colorPrimary,
    offset: Offset(0, 0),
    spreadRadius: 20,
    blurRadius: 70,
  )
];

List<BoxShadow> lightShadow = [
  BoxShadow(
    color: Colors.white,
    offset: Offset(0, 0),
    spreadRadius: 0,
    blurRadius: 5,
  )
];
