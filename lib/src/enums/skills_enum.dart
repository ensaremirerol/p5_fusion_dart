enum Skill {
  phys,
  gun,
  fire,
  ice,
  electric,
  wind,
  psy,
  nuclear,
  bless,
  curse,
  almighty,
  ailment,
  support,
  passive,
  healing,
  trait
}

/// Extension methods for [Skill].
extension SkillExtension on Skill {
  /// Returns the name of [Skill]
  String get name {
    switch (this) {
      case Skill.phys:
        return 'phys';
      case Skill.gun:
        return 'gun';
      case Skill.fire:
        return 'fire';
      case Skill.ice:
        return 'ice';
      case Skill.electric:
        return 'electric';
      case Skill.wind:
        return 'wind';
      case Skill.psy:
        return 'psy';
      case Skill.nuclear:
        return 'nuclear';
      case Skill.bless:
        return 'bless';
      case Skill.curse:
        return 'curse';
      case Skill.almighty:
        return 'almighty';
      case Skill.ailment:
        return 'ailment';
      case Skill.support:
        return 'support';
      case Skill.passive:
        return 'passive';
      case Skill.healing:
        return 'healing';
      case Skill.trait:
        return 'trait';
    }
  }
}

/// Returns the [Skill] from the given [value]
Skill? skillFromString(String value) {
  switch (value) {
    case 'phys':
      return Skill.phys;
    case 'gun':
      return Skill.gun;
    case 'fire':
      return Skill.fire;
    case 'ice':
      return Skill.ice;
    case 'electric':
      return Skill.electric;
    case 'wind':
      return Skill.wind;
    case 'psy':
      return Skill.psy;
    case 'nuclear':
      return Skill.nuclear;
    case 'bless':
      return Skill.bless;
    case 'curse':
      return Skill.curse;
    case 'almighty':
      return Skill.almighty;
    case 'ailment':
      return Skill.ailment;
    case 'support':
      return Skill.support;
    case 'passive':
      return Skill.passive;
    case 'healing':
      return Skill.healing;
    case 'trait':
      return Skill.trait;
    default:
      return null;
  }
}
