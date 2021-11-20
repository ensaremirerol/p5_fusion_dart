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

  print(DLCPersona.izanagi.name);
}
