import 'package:p5_fusion_dart/p5_fusion_dart.dart';
import 'package:p5_fusion_dart/src/const/combos.dart';
import 'package:p5_fusion_dart/src/const/personas.dart';
import 'package:p5_fusion_dart/src/fusion_data.dart';
import '../utils/list_extensions.dart';

/// A class that calculates the fusion of two [Persona]s.
class PersonaService {
  final PersonaRepository _repository;

  /// Constructor for the [PersonaService]
  /// Uses the [PersonaRepository] to get the [Persona]s
  PersonaService(this._repository);

  /// Returns a [List] of [Fusion]s can be fused from [persona]
  List<Fusion> getFusionsFrom(Persona persona) {
    final List<Fusion> fusions = <Fusion>[];

    for (final Persona otherPersona in _repository.personas) {
      if (otherPersona != persona) {
        final Persona? fusedPersona = fuse(persona, otherPersona);
        if (fusedPersona != null) {
          fusions.add(
              Fusion(source: [persona, otherPersona], target: fusedPersona));
        }
      }
    }
    fusions.sort();
    return fusions;
  }

  /// Returns a [List] of [Fusion]s that fuses [persona]
  List<Fusion> getFusionsTo(Persona persona) {
    // Can't fuse rares
    if (persona.rare) return [];
    // Special fusion
    if (persona.special) return _getSpecialFusionsTo(persona);
    // List of combos that results the same arcana
    final List<List<Arcana>> resultingArcanas = persona.arcana.resultingCombos;
    // List of fusions
    final List<Fusion> fusions = <Fusion>[];
    // Iterate over all combos
    for (final List<Arcana> resultingArcana in resultingArcanas) {
      // Down-rank fusion + rare fusions
      if (resultingArcana.containsDuplicate()) {
        final List<Persona> list1 = _repository.personas
            .where((Persona p) => p.arcana == resultingArcana[0])
            .toList();
        list1.combinations2((first, second) {
          final Persona? fusedPersona = fuse(first, second);
          if (fusedPersona != null) {
            fusions.add(Fusion(source: [first, second], target: fusedPersona));
          }
        });
        for (final Persona rare in _repository.getRarePersonas) {
          for (final Persona normal in list1) {
            final Persona? fusedPersona = fuse(rare, normal);
            if (fusedPersona != null) {
              fusions.add(Fusion(source: [rare, normal], target: fusedPersona));
            }
          }
        }
      } else {
        final List<Persona> list1 = _repository.personas
            .where((Persona p) => p.arcana == resultingArcana[0])
            .toList();
        final List<Persona> list2 = _repository.personas
            .where((Persona p) => p.arcana == resultingArcana[1])
            .toList();

        for (final Persona p1 in list1) {
          for (final Persona p2 in list2) {
            final Persona? fusedPersona = fuse(p1, p2);
            if (fusedPersona != null) {
              fusions.add(Fusion(source: [p1, p2], target: fusedPersona));
            }
          }
        }
      }
    }

    return fusions.where((element) => element.target == persona).toList()
      ..sort();
  }

  /// Fuses two [Persona]s together.
  Persona? fuse(Persona persona1, Persona persona2) {
    Persona? persona;
    if ((persona1.rare && persona2.rare) || persona1 == persona2) return null;
    persona = _getSpecialFuse(persona1, persona2);
    if (persona != null) {
      return persona;
    }
    if ((persona1.rare && !persona2.rare) ||
        (!persona1.rare && persona2.rare)) {
      final Persona rarePersona = persona1.rare ? persona1 : persona2;
      final Persona normalPersona = persona1.rare ? persona2 : persona1;
      persona = _getRareFuse(rarePersona, normalPersona);
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

  List<Fusion> _getSpecialFusionsTo(Persona persona) {
    final List<Fusion> fusions = <Fusion>[];
    specialCombos.forEach((element) {
      if (element["result"] == persona.name) {
        final List<String> sourcesString = element["sources"] as List<String>;
        final List<Persona> sources = [
          for (String name in sourcesString) _repository.getPersonaByName(name)
        ];
        fusions.add(Fusion(source: sources, target: persona));
      }
    });
    return fusions;
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
