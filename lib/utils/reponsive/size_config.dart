import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();

  static final SizeConfig instance = SizeConfig._();

  static late double _widthMultipler;
  static late double _heightMultipler;

  static void init(BoxConstraints constraints,
      {required double designScreenWidth, required double desginScreenHeight}) {
    _widthMultipler = constraints.maxWidth / designScreenWidth;
    _heightMultipler = constraints.maxHeight / desginScreenHeight;
  }

  double? getWidth(double? width) {
    if (width == null) {
      return null;
    }
    return width * _widthMultipler;
  }

  double? getHeight(double? height) {
    if (height == null) {
      return null;
    }
    return height * _heightMultipler;
  }

  EdgeInsets? paddingOnly(
      {double? left, double? right, double? top, double? bottom}) {
    return EdgeInsets.only(
      left: left != null ? left * _widthMultipler : 0,
      right: left != null ? left * _widthMultipler : 0,
      top: top != null ? top * _heightMultipler : 0,
      bottom: bottom != null ? bottom * _heightMultipler : 0,
    );
  }

  EdgeInsets? paddingAll({double? all}) {
    return EdgeInsets.all(all != null ? all * _widthMultipler : 0);
  }

  EdgeInsets? paddingSymmetric({double? horizontal, double? vertical}) {
    return EdgeInsets.symmetric(
      horizontal: horizontal != null ? horizontal * _widthMultipler : 0,
      vertical: vertical != null ? vertical * _heightMultipler : 0,
    );
  }
}
