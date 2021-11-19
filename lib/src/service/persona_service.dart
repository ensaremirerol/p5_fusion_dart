import 'dart:math' as math;

import 'package:p5_fusion_dart/p5_fusion.dart';
import 'package:p5_fusion_dart/src/const/combos.dart';
import 'package:p5_fusion_dart/src/const/personas.dart';

class PersonaService {
  final PersonaRepository _repository;

  /// Constructor for the [PersonaService]
  /// Uses the [PersonaRepository] to get the [Persona]s
  PersonaService(this._repository);

  /// Fuses two [Persona]s together.
  Persona? fuse(Persona persona1, Persona persona2) {
    Persona? persona;
    persona = _getSpecialFuse(persona1, persona2);
    if (persona != null) {
      return persona;
    }
    if ((persona1.rare && !persona2.rare) ||
        (!persona1.rare && persona2.rare)) {
      final Persona rarePersona = persona1.rare ? persona1 : persona2;
      final Persona normalPersona = persona1.rare ? persona2 : persona1;
      persona = this._getRareFuse(rarePersona, normalPersona);
      return persona;
    }

    return _normalFuse(persona1, persona2);
  }

  // Get special fuses from special combos
  Persona? _getSpecialFuse(Persona persona1, Persona persona2) {
    String? name;
    specialCombos.forEach((element) {
      if ((element["sources"] as List<String>).contains(persona1.name) &&
          (element["sources"] as List<String>).contains(persona2.name)) {
        name = element["result"] as String;
      }
    });
    return name == null ? null : _repository.getPersonaByName(name!);
  }

  // Calculate rare fusion
  Persona? _getRareFuse(Persona rarePersona, Persona normalPersona) {
    int modifier = rareCombos[normalPersona.arcana]![
        rarePersonae.indexOf(rarePersona.name)];

    final List<Persona> allPersonasByArcana = _repository.personas
        .where((element) => element.arcana == normalPersona.arcana)
        .toList()
      ..sort();

    final int indexOfNormalPersona = allPersonasByArcana.indexOf(normalPersona);
    Persona? result;
    try {
      result = allPersonasByArcana[(indexOfNormalPersona + modifier)];
    } catch (e) {
      return null;
    }

    while (result != null && (result.special || result.rare)) {
      if (modifier > 0) {
        modifier++;
      } else {
        modifier--;
      }
      try {
        result = allPersonasByArcana[(indexOfNormalPersona + modifier)];
      } catch (e) {
        return null;
      }
    }

    return result;
  }

  // Calculate normal fusion

  Persona? _normalFuse(Persona persona1, Persona persona2) {
    int level = 1 + (persona1.level + persona2.level) ~/ 2;
    Arcana? arcana = persona1.arcana.arcanaCombo(persona2.arcana);
    if (arcana == null) {
      return null;
    }

    final List<Persona> allPersonasByArcana = _repository.personas
        .where((element) => element.arcana == arcana)
        .toList()
      ..sort();

    if (persona1.arcana == persona2.arcana) {
      for (int i = allPersonasByArcana.length - 1; i >= 0; i--) {
        if (allPersonasByArcana[i].level <= level) {
          if (allPersonasByArcana[i].special ||
              allPersonasByArcana[i].rare ||
              allPersonasByArcana[i] == persona1 ||
              allPersonasByArcana[i] == persona2) {
            continue;
          }
          return allPersonasByArcana[i];
        }
      }
    } else {
      for (int i = 0; i < allPersonasByArcana.length; i++) {
        if (allPersonasByArcana[i].level >= level) {
          if (allPersonasByArcana[i].special || allPersonasByArcana[i].rare) {
            continue;
          }
          return allPersonasByArcana[i];
        }
      }
    }
  }
}
