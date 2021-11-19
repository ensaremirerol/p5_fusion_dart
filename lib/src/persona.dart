import 'package:equatable/equatable.dart';
import 'package:p5_fusion_dart/p5_fusion_dart.dart';

/// Stores a Persona's data.
class Persona extends Equatable with Comparable {
  final String name;
  final Arcana arcana;
  final int level;
  final Map<Elements, Resistance> elements;
  final Map<String, int> skills;
  final Map<Stat, int> stats;
  final bool dlc;
  final bool special;
  final bool rare;

  const Persona({
    required this.name,
    required this.arcana,
    required this.level,
    required this.elements,
    required this.skills,
    required this.stats,
    required this.dlc,
    required this.special,
    required this.rare,
  });

  factory Persona.fromJson(String name, Map<String, dynamic> json) {
    return Persona(
      name: name,
      arcana: Arcana.values[json['arcana']],
      level: json['level'],
      elements: {
        for (Elements element in Elements.values)
          element: Resistance.values[json['elems'][element.index]],
      },
      skills: json['skills'],
      stats: {
        for (Stat stat in Stat.values) stat: json['stats'][stat.index],
      },
      dlc: json['dlc'] ?? false,
      special: json['special'] ?? false,
      rare: json['rare'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'arcana': arcana.index,
      'level': level,
      'elements': Map.fromIterable(Elements.values.map((e) {
        return MapEntry(
          e,
          elements[e]!.index,
        );
      })),
      'skills': skills,
      'stats': Map.fromIterable(Stat.values.map((s) {
        return MapEntry(
          s,
          stats[s],
        );
      })),
      'dlc': dlc,
    };
  }

  bool operator <(Persona a) {
    return level < a.level;
  }

  bool operator >(Persona a) {
    return level > a.level;
  }

  @override
  String toString() => name;

  @override
  List<Object?> get props => [name];

  @override
  int compareTo(other) {
    return (level - other.level).toInt();
  }
}
