enum Elements {
  physical,
  gun,
  fire,
  ice,
  electric,
  wind,
  psychic,
  nuclear,
  bless,
  curse,
}

extension ElementsExtension on Elements {
  String get name {
    switch (this) {
      case Elements.physical:
        return 'Physical';
      case Elements.gun:
        return 'Gun';
      case Elements.fire:
        return 'Fire';
      case Elements.ice:
        return 'Ice';
      case Elements.electric:
        return 'Electric';
      case Elements.wind:
        return 'Wind';
      case Elements.psychic:
        return 'Psychic';
      case Elements.nuclear:
        return 'Nuclear';
      case Elements.bless:
        return 'Bless';
      case Elements.curse:
        return 'Curse';
    }
  }
}
