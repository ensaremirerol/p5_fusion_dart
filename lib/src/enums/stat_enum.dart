enum Stat {
  strength,
  magic,
  endurance,
  agility,
  luck,
}

/// Extension methods for [Stat]
extension StatExtension on Stat {
  /// Returns the name of [Stat]
  String get name {
    switch (this) {
      case Stat.strength:
        return "Strength";
      case Stat.magic:
        return "Magic";
      case Stat.endurance:
        return "Endurance";
      case Stat.agility:
        return "Agility";
      case Stat.luck:
        return "Luck";
    }
  }

  /// Returns the abbreviation of [Stat]
  String get shortName {
    switch (this) {
      case Stat.strength:
        return "STR";
      case Stat.magic:
        return "MAG";
      case Stat.endurance:
        return "END";
      case Stat.agility:
        return "AGI";
      case Stat.luck:
        return "LUK";
    }
  }
}
