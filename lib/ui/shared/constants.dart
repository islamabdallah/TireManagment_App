import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

const Color mainColor = Colors.black87;
const Color defaultColor = Color(0xFF212121);
const Color greyColor = Color(0xFF707070);
const Color redColor = Color(0xFFDF343D);

// text styles
const appBarsTextStyle = TextStyle(
  color: Colors.white,
);

bool isTaplet = 100.w >= 500 ? true : false;
