# p5_fusion_dart
Library that can calculate fusions in Persona 5 game.

## Example

```dart
SkillRepository skillRepository = new SkillRepository();
final PersonaRepository repo = PersonaRepository();
final PersonaService service = PersonaService(repo);
print(service.fuse(
    repo.getPersonaByName("Regent"), repo.getPersonaByName("Obariyon")));
print(service.getFusionsFrom(repo.getPersonaByName("Arsene")));
print(service.getFusionsTo(repo.getPersonaByName("Queen's Necklace")));
print(service.getFusionsTo(repo.getPersonaByName("Arsene")));
print(skillRepository.getSkill("Absorb Bless"));
```

## Credits
Ideas, logics, data, etc. have been gathered from:
- https://github.com/arantius/persona-fusion-calculator
- https://github.com/Heimdall409/persona4-fusion-calculator
- https://github.com/aqiu384/aqiu384.github.io/tree/master/p5-tool
- https://github.com/chinhodado/persona5_calculator