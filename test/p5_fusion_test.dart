import "package:test/test.dart";

import 'package:p5_fusion_dart/p5_fusion_dart.dart';

void main() {
  SkillRepository skillRepository = new SkillRepository();
  final PersonaRepository repo = PersonaRepository();
  final PersonaService service = PersonaService(repo);
  print(service.fuse(
      repo.getPersonaByName("Regent"), repo.getPersonaByName("Obariyon")));

  print(service.getFusionsFrom(repo.getPersonaByName("Arsene")));
  print(service.getFusionsTo(repo.getPersonaByName("Queen's Necklace")));
  print(service.getFusionsTo(repo.getPersonaByName("Arsene")));

  print(skillRepository.getSkill("Absorb Bless"));
  test('CalculationTest', () {
    _testInterface(
        persona1: "Regent", persona2: "Obariyon", expected: "Arsene");
    expect(
        service.fuse(repo.getPersonaByName("Regent"),
            repo.getPersonaByName("Queen's Necklace")),
        null);
    expect(
        service.fuse(
            repo.getPersonaByName("Arsene"), repo.getPersonaByName("Arsene")),
        null);
  });
}

void _testInterface(
    {required String persona1,
    required String persona2,
    required String expected}) {
  final PersonaRepository repo = PersonaRepository();
  final PersonaService service = PersonaService(repo);
  expect(
      service.fuse(
          repo.getPersonaByName(persona1), repo.getPersonaByName(persona2)),
      repo.getPersonaByName(expected));
}
