/// @nodoc
import 'package:p5_fusion_dart/p5_fusion.dart';

class SkillData {
  final String name;
  final Skill element;
  final int cost;
  final String effect;
  final Map<String, int> personas;
  final List<String> negotiations;
  final List<String> fusion;
  final String? unique;
  final bool dlc;
  final String? note;

  SkillData(
      {required this.name,
      required this.element,
      required this.cost,
      required this.effect,
      required this.personas,
      required this.negotiations,
      required this.fusion,
      this.unique,
      required this.dlc,
      this.note});

  factory SkillData.fromJson(Map<String, dynamic> json) {
    return SkillData(
      name: json['name'] as String,
      element: skillFromString(json['element'] as String)!,
      cost: json['cost'] as int,
      effect: json['effect'] as String,
      personas: json['personas'] as Map<String, int>,
      negotiations: json['negotiations'] as List<String>,
      fusion: json['fusion'] as List<String>,
      unique: json['unique'] as String?,
      dlc: json['dlc'] as bool,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'element': element.name,
      'cost': cost,
      'effect': effect,
      'personas': personas,
      'negotiations': negotiations,
      'fusion': fusion,
      'unique': unique,
      'dlc': dlc,
      'note': note,
    };
  }
}
