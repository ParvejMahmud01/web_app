import 'dart:io';

import 'package:web_app/core/const/app_export.dart';

SizedBox bottomSizeBox() {
  return SizedBox(height: 50);
}

SizedBox topSizeBox() {
  return SizedBox(height: Platform.isAndroid ? 30 : 60);
}

double paddingX() {
  return getWidth(20);
}

SizedBox boxHight4() {
  return SizedBox(height: getHeight(4));
}

SizedBox boxHight6() {
  return SizedBox(height: getHeight(6));
}

SizedBox boxHight10() {
  return SizedBox(height: getHeight(10));
}

SizedBox boxHight12() {
  return SizedBox(height: getHeight(12));
}

SizedBox boxHight16() {
  return SizedBox(height: getHeight(16));
}

SizedBox boxWidth4() {
  return SizedBox(width: getWidth(4));
}

SizedBox boxWidth6() {
  return SizedBox(width: getWidth(6));
}

SizedBox boxWidth10() {
  return SizedBox(width: getWidth(10));
}

SizedBox boxWidth12() {
  return SizedBox(width: getWidth(12));
}

SizedBox boxWidth16() {
  return SizedBox(width: getWidth(16));
}

SizedBox boxHight20() {
  return SizedBox(height: getHeight(20));
}

SizedBox boxWidth20() {
  return SizedBox(width: getWidth(20));
}

SizedBox boxHight24() {
  return SizedBox(height: getHeight(24));
}

SizedBox boxWidth24() {
  return SizedBox(width: getWidth(24));
}

SizedBox boxHight32() {
  return SizedBox(height: getHeight(32));
}

SizedBox boxWidth32() {
  return SizedBox(width: getWidth(32));
}

SizedBox boxHight40() {
  return SizedBox(height: getHeight(40));
}

SizedBox boxWidth40() {
  return SizedBox(width: getWidth(40));
}

BorderRadius defaultRadius() {
  return BorderRadius.circular(getWidth(16));
}

BorderRadius radius4() {
  return BorderRadius.circular(getWidth(4));
}

BorderRadius radius8() {
  return BorderRadius.circular(getWidth(8));
}

BorderRadius radius10() {
  return BorderRadius.circular(getWidth(10));
}

BorderRadius radius12() {
  return BorderRadius.circular(getWidth(12));
}

BorderRadius radius16() {
  return BorderRadius.circular(getWidth(16));
}

BorderRadius radius100() {
  return BorderRadius.circular(getWidth(100));
}

EdgeInsets defaultPadding() {
  return EdgeInsets.symmetric(horizontal: getWidth(20));
}
