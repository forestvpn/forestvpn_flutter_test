import 'package:flutter/material.dart';
import 'package:forestvpn_test/consts/colors.dart';

abstract class MainStyles {

  ///   FontWeight W400
  static TextStyle kBlackColorW400(double fontSize) {
    return TextStyle(
      color: MainColors.kBlackColor,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      fontFamily: 'SF Pro Display',
    );
  }

  static TextStyle kWhiteColor2W400(double fontSize) {
    return TextStyle(
      color: MainColors.kWhiteColor2,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      fontFamily: 'SF Pro Display',
    );
  }

  static TextStyle kGreyColorW400(double fontSize) {
    return TextStyle(
      color: MainColors.kGreyColor,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      fontFamily: 'SF Pro Display',
    );
  }
}