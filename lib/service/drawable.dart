import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image/image.dart' as imglib;

List<Image> splitImage(imglib.Image image) {
  int x = 0, y = 0;
  int width = (image.width / 3).round();
  int height = (image.height / 3).round();

  // split image to parts
  List<imglib.Image> parts = [];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      parts.add(imglib.copyCrop(image, x, y, width, height));
      x += width;
    }
    x = 0;
    y += height;
  }

  List<Image> output = [];
  for (imglib.Image img in parts) {
    output.add(Image.memory(Uint8List.fromList(imglib.encodeJpg(img))));
  }

  return output;
}

Future<DrawableRoot?> generateDrawableFrom(String svgRaw) async {
  try {
    return await svg.fromSvgString(svgRaw, svgRaw);
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}

Future<List<Image>> generateGoodSplited(
  DrawableRoot svgRoot,
  Color backgroundColor,
) async {
  final colorFilter = ColorFilter.mode(backgroundColor, BlendMode.overlay);

  final img = await svgRoot
      .toPicture(size: const Size(1000, 1000), colorFilter: colorFilter)
      .toImage(1000, 1000);

  try {
    final byteData = await img.toByteData(format: ImageByteFormat.png);
    if (byteData == null) throw ('byteDate');
    final currentImage = imglib.decodeImage(byteData.buffer.asUint8List());

    if (currentImage == null) throw ('currentImage');
    return splitImage(currentImage);
  } catch (e) {
    debugPrint('===> [CharacterCrl] generateGoodSplited error $e');
    return [];
  }
}
