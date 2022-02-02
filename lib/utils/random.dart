import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

Color generateRandomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

String generatedRandomId() {
  final l = List.generate(12, (_) => Random().nextInt(100));
  final avatarRandomId = l.join();
  return avatarRandomId;
}
