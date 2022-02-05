// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension CharacterCopyWith on Character {
  Character copyWith({
    String? id,
    String? name,
    String? svgCode,
    DrawableRoot? svgRoot,
  }) {
    return Character(
      id: id ?? this.id,
      svgCode: svgCode ?? this.svgCode,
      svgRoot: svgRoot ?? this.svgRoot,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as String,
      svgCode: json['svgCode'] as String? ?? "",
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'svgCode': instance.svgCode,
    };
