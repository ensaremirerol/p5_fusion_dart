import 'package:p5_fusion_dart/p5_fusion.dart';

/// Stores a Skills' data.
class SkillData {
  final String name;
  final Skill element;

  /// Use [calculateCost] instead
  final int? _cost;
  final String effect;
  final Map personas;
  final String? negotiations;
  final List<String>? fusion;
  final String? unique;
  final bool dlc;
  final String? note;

  SkillData(
      {required this.name,
      required this.element,
      required this.effect,
      required this.personas,
      required this.negotiations,
      this.fusion,
      this.unique,
      required this.dlc,
      this.note,
      int? cost})
      : _cost = cost;

  factory SkillData.fromJson(String name, Map<String, dynamic> json) {
    return SkillData(
      name: name,
      element: skillFromString(json['element'] as String)!,
      effect: json['effect'] as String,
      personas: json['personas'],
      negotiations: json['talk'],
      fusion: json['fuse'] is String ? [json['fuse']] : json['fuse'],
      unique: json['unique'],
      dlc: json['dlc'] ?? false,
      note: json['note'],
      cost: json['cost'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'element': element.name,
      'cost': _cost,
      'effect': effect,
      'personas': personas,
      'negotiations': negotiations,
      'fusion': fusion,
      'unique': unique,
      'dlc': dlc,
      'note': note,
    };
  }

  /// Calculates the cost of the skill
  String calculateCost() {
    if (_cost == null) {
      return '-';
    } else if (_cost! < 100) {
      return "$_cost% HP";
    }
    return "${_cost! ~/ 100}% SP";
  }

  @override
  String toString() {
    return 'SkillData{name: $name, element: $element, cost: $_cost, effect: $effect, personas: $personas, negotiations: $negotiations, fusion: $fusion, unique: $unique, dlc: $dlc, note: $note}';
  }
}
