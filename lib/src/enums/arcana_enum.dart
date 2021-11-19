import "../const/combos.dart";

enum Arcana {
  fool,
  magician,
  priestess,
  empress,
  emperor,
  hierophant,
  lovers,
  chariot,
  strength,
  hermit,
  fortune,
  justice,
  hanged,
  death,
  temperance,
  devil,
  tower,
  star,
  moon,
  sun,
  judgement,
}

/// Extension methods for [Arcana]
extension ArcanaExtension on Arcana {
  /// Returns the result from the combo of two [Arcana].
  /// If the combo is not valid, returns null.
  /// ```dart
  ///   Arcana.fool.arcanaCombo(Arcana.magician) == Arcana.death
  /// ```
  Arcana? arcanaCombo(Arcana other) {
    for (Map combo in arcana2Combos) {
      if ((combo["source"] as List).contains(this) &&
          (combo["source"] as List).contains(other)) {
        return combo["result"] as Arcana;
      }
    }
    return null;
  }

  String get name {
    switch (this) {
      case Arcana.fool:
        return 'Fool';
      case Arcana.magician:
        return 'Magician';
      case Arcana.priestess:
        return 'Priestess';
      case Arcana.empress:
        return 'Empress';
      case Arcana.emperor:
        return 'Emperor';
      case Arcana.hierophant:
        return 'Hierophant';
      case Arcana.lovers:
        return 'Lovers';
      case Arcana.chariot:
        return 'Chariot';
      case Arcana.strength:
        return 'Strength';
      case Arcana.hermit:
        return 'Hermit';
      case Arcana.fortune:
        return 'Fortune';
      case Arcana.justice:
        return 'Justice';
      case Arcana.hanged:
        return 'Hanged';
      case Arcana.death:
        return 'Death';
      case Arcana.temperance:
        return 'Temperance';
      case Arcana.devil:
        return 'Devil';
      case Arcana.tower:
        return 'Tower';
      case Arcana.star:
        return 'Star';
      case Arcana.moon:
        return 'Moon';
      case Arcana.sun:
        return 'Sun';
      case Arcana.judgement:
        return 'Judgement';
    }
  }
}
