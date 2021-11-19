import 'package:p5_fusion_dart/p5_fusion_dart.dart';
import 'package:p5_fusion_dart/src/const/skills.dart';
import 'package:p5_fusion_dart/src/skill_data.dart';

/// Holds all [SkillData]s.
class SkillRepository {
  final List<SkillData> _skills;

  SkillRepository()
      : _skills = [
          for (String key in skillMap.keys)
            SkillData.fromJson(key, skillMap[key])
        ];

  List<SkillData> get skills => _skills;

  SkillData? getSkill(String name) {
    return _skills.firstWhere((skill) => skill.name == name,
        orElse: () => throw Exception('Skill $name not found'));
  }

  List<SkillData> getSkillsByElement(Skill type) {
    return _skills.where((skill) => skill.element == type).toList();
  }

  List<SkillData> search(String query) {
    return _skills.where((skill) => skill.name.contains(query)).toList();
  }
}
