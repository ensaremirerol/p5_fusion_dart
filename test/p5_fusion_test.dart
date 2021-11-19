import "package:test/test.dart";

import "package:p5_fusion_dart/p5_fusion.dart";

void main() {
  test('CalculationTest', () {
    _testInterface(
        persona1: "Regent", persona2: "Obariyon", expected: "Arsene");
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
