import 'package:flutter/material.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;

const kAppName = 'Flow';
const kLoadingImagePath = "assets/images/loding_spinner.gif";
const kInputPagePadding = EdgeInsets.all(30.0);

const kGradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Asset.Colors.hotPink, Asset.Colors.skyBlue],
  ),
);

const kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 43.0,
  letterSpacing: 2.5,
  fontWeight: FontWeight.w700,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
  border: UnderlineInputBorder(),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Asset.Colors.blueBlack,
      width: 1.0,
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Asset.Colors.blueBlack,
      width: 1.0,
    ),
  ),
);
