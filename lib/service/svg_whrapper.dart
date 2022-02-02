import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWrapper {
  final String rawSvg;

  SvgWrapper(this.rawSvg);

  Future<DrawableRoot?> generateLogo() async {
    try {
      return await svg.fromSvgString(rawSvg, rawSvg);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
