import 'package:p5_fusion_dart/src/const/dlc_personas.dart';

enum DLCPersona {
  orpheus,
  izanagi,
  thanatos,
  magatsu,
  kaguya,
  ariadne,
  asterius,
  tsukiyomi,
  messiah
}

extension DLCPersonaExtension on DLCPersona {
  List<String> get name {
    switch (this) {
      case DLCPersona.orpheus:
        return dlcPersona[this.index];
      case DLCPersona.izanagi:
        return dlcPersona[this.index];
      case DLCPersona.thanatos:
        return dlcPersona[this.index];
      case DLCPersona.magatsu:
        return dlcPersona[this.index];
      case DLCPersona.kaguya:
        return dlcPersona[this.index];
      case DLCPersona.ariadne:
        return dlcPersona[this.index];
      case DLCPersona.asterius:
        return dlcPersona[this.index];
      case DLCPersona.tsukiyomi:
        return dlcPersona[this.index];
      case DLCPersona.messiah:
        return dlcPersona[this.index];
    }
  }
}
