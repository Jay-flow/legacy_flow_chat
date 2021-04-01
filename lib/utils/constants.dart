import 'package:flutter/material.dart';
import 'package:flow_chat/utils/asset.dart' as asset;

const appName = 'Flow';
const loadingImagePath = "assets/images/loding_spinner.gif";
const inputPagePadding = EdgeInsets.all(30.0);

const gradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [asset.Colors.hotPink, asset.Colors.skyBlue],
  ),
);

const titleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 43.0,
  letterSpacing: 2.5,
  fontWeight: FontWeight.w700,
);

const textFieldDecoration = InputDecoration(
  hintText: 'Enter value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
  border: UnderlineInputBorder(),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: asset.Colors.grey,
      width: 1.5,
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: asset.Colors.hotPink,
      width: 2.0,
    ),
  ),
);
