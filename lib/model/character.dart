import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multiavatar/multiavatar.dart';

import '../service/drawable.dart';

part 'character.g.dart';

@CopyWith()
@JsonSerializable()
class Character {
  final String id;
  String svgCode;
  @JsonKey(ignore: true)
  DrawableRoot? svgRoot;

  Character({
    required this.id,
    this.svgCode = "",
    this.svgRoot,
  }) {
    svgCode = multiavatar(id, trBackground: true);
  }

  Future<void> generateDrawable() async {
    svgRoot = await generateDrawableFrom(svgCode);
  }

  factory Character.fromJson(Map<String, dynamic> data) =>
      _$CharacterFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  String toString() => toJson().toString();
}
