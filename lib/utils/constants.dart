import 'package:flutter/material.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;

const kAppName = 'Flow';
const testProfileImage1 =
    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80";
const testMessage1 =
    "Loving can hurt, loving can hurt sometimes But It's the only thing that I know When it gets hard, you know it can get hard sometimes It is the only thing makes us feel alive...";

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
