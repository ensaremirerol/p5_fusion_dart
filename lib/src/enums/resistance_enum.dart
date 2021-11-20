enum Resistance {
  weak,
  normal,
  resist,
  nullify,
  reflect,
  absorb,
}

extension ResistanceExtension on Resistance {
  String get name {
    switch (this) {
      case Resistance.weak:
        return 'weak';
      case Resistance.normal:
        return 'normal';
      case Resistance.resist:
        return 'resist';
      case Resistance.nullify:
        return 'nullify';
      case Resistance.reflect:
        return 'reflect';
      case Resistance.absorb:
        return 'absorb';
      default:
        return 'normal';
    }
  }
}
