// from https://github.com/chinhodado/persona5_calculator

import '../enums/arcana_enum.dart';

const rareCombos = {
  Arcana.fool: [-1, 1, -1, 1, -1, -1, 1, 2],
  Arcana.magician: [1, -1, 2, -1, 1, 1, 1, 1],
  Arcana.priestess: [-1, 1, -1, 2, 1, -1, 1, 1],
  Arcana.empress: [-1, 2, -1, 1, 1, 1, -1, 1],
  Arcana.emperor: [2, -1, 1, -1, -1, 1, 1, -1],
  Arcana.hierophant: [1, -1, 1, -2, 1, -1, -1, -1],
  Arcana.lovers: [-1, 1, -1, 1, -1, -1, -2, 1],
  Arcana.chariot: [1, -1, 1, -1, 1, -2, -1, -1],
  Arcana.justice: [1, -1, -1, 2, 1, 1, -1, 1],
  Arcana.hermit: [2, -1, -1, 1, 1, 1, 1, -2],
  Arcana.fortune: [1, -1, 2, -1, -2, -1, 1, -1],
  Arcana.strength: [-1, 1, -2, 1, 1, 1, -1, -1],
  Arcana.hanged: [1, 1, -1, -1, 1, 2, -1, -1],
  Arcana.death: [1, -1, 1, 1, -1, -1, 2, 1],
  Arcana.temperance: [-1, 1, -1, -1, 1, 1, -1, 2],
  Arcana.devil: [-2, 1, -1, 1, 1, 2, -1, -1],
  Arcana.tower: [-1, -2, 1, 1, 1, 1, -1, -1],
  Arcana.star: [1, -1, 1, -1, 1, -1, 1, 1],
  Arcana.moon: [-1, 2, 1, -1, 1, -1, -1, -1],
  Arcana.sun: [1, -1, -1, 1, 1, -1, 2, 1],
  Arcana.judgement: [-1, -1, 1, -1, 1, 1, -1, -1]
};

const arcana2Combos = [
  {
    'source': [Arcana.fool, Arcana.fool],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.fool, Arcana.magician],
    'result': Arcana.death
  },
  {
    'source': [Arcana.fool, Arcana.priestess],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.fool, Arcana.empress],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.fool, Arcana.emperor],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.fool, Arcana.hierophant],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.fool, Arcana.lovers],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.fool, Arcana.chariot],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.fool, Arcana.justice],
    'result': Arcana.star
  },
  {
    'source': [Arcana.fool, Arcana.hermit],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.fool, Arcana.fortune],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.fool, Arcana.strength],
    'result': Arcana.death
  },
  {
    'source': [Arcana.fool, Arcana.hanged],
    'result': Arcana.tower
  },
  {
    'source': [Arcana.fool, Arcana.death],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.fool, Arcana.temperance],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.fool, Arcana.devil],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.fool, Arcana.tower],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.fool, Arcana.star],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.fool, Arcana.moon],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.fool, Arcana.sun],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.fool, Arcana.judgement],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.magician, Arcana.magician],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.magician, Arcana.priestess],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.magician, Arcana.empress],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.magician, Arcana.emperor],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.magician, Arcana.hierophant],
    'result': Arcana.death
  },
  {
    'source': [Arcana.magician, Arcana.lovers],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.magician, Arcana.chariot],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.magician, Arcana.justice],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.magician, Arcana.hermit],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.magician, Arcana.fortune],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.magician, Arcana.strength],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.magician, Arcana.hanged],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.magician, Arcana.death],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.magician, Arcana.temperance],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.magician, Arcana.devil],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.magician, Arcana.tower],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.magician, Arcana.star],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.magician, Arcana.moon],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.magician, Arcana.sun],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.magician, Arcana.judgement],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.priestess, Arcana.priestess],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.priestess, Arcana.empress],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.priestess, Arcana.emperor],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.priestess, Arcana.hierophant],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.priestess, Arcana.lovers],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.priestess, Arcana.chariot],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.priestess, Arcana.justice],
    'result': Arcana.death
  },
  {
    'source': [Arcana.priestess, Arcana.hermit],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.priestess, Arcana.fortune],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.priestess, Arcana.strength],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.priestess, Arcana.hanged],
    'result': Arcana.death
  },
  {
    'source': [Arcana.priestess, Arcana.death],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.priestess, Arcana.temperance],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.priestess, Arcana.devil],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.priestess, Arcana.tower],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.priestess, Arcana.star],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.priestess, Arcana.moon],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.priestess, Arcana.sun],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.priestess, Arcana.judgement],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.empress, Arcana.empress],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.empress, Arcana.emperor],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.empress, Arcana.hierophant],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.empress, Arcana.lovers],
    'result': Arcana.judgement
  },
  {
    'source': [Arcana.empress, Arcana.chariot],
    'result': Arcana.star
  },
  {
    'source': [Arcana.empress, Arcana.justice],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.empress, Arcana.hermit],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.empress, Arcana.fortune],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.empress, Arcana.strength],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.empress, Arcana.hanged],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.empress, Arcana.death],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.empress, Arcana.temperance],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.empress, Arcana.devil],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.empress, Arcana.tower],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.empress, Arcana.star],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.empress, Arcana.moon],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.empress, Arcana.sun],
    'result': Arcana.tower
  },
  {
    'source': [Arcana.empress, Arcana.judgement],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.emperor, Arcana.emperor],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.emperor, Arcana.hierophant],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.emperor, Arcana.lovers],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.emperor, Arcana.chariot],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.emperor, Arcana.justice],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.emperor, Arcana.hermit],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.emperor, Arcana.fortune],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.emperor, Arcana.strength],
    'result': Arcana.tower
  },
  {
    'source': [Arcana.emperor, Arcana.hanged],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.emperor, Arcana.death],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.emperor, Arcana.temperance],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.emperor, Arcana.devil],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.emperor, Arcana.tower],
    'result': Arcana.star
  },
  {
    'source': [Arcana.emperor, Arcana.star],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.emperor, Arcana.moon],
    'result': Arcana.tower
  },
  {
    'source': [Arcana.emperor, Arcana.sun],
    'result': Arcana.judgement
  },
  {
    'source': [Arcana.emperor, Arcana.judgement],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.hierophant, Arcana.hierophant],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.hierophant, Arcana.lovers],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.hierophant, Arcana.chariot],
    'result': Arcana.star
  },
  {
    'source': [Arcana.hierophant, Arcana.justice],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.hierophant, Arcana.hermit],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.hierophant, Arcana.fortune],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.hierophant, Arcana.strength],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.hierophant, Arcana.hanged],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.hierophant, Arcana.death],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.hierophant, Arcana.temperance],
    'result': Arcana.death
  },
  {
    'source': [Arcana.hierophant, Arcana.devil],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.hierophant, Arcana.tower],
    'result': Arcana.judgement
  },
  {
    'source': [Arcana.hierophant, Arcana.star],
    'result': Arcana.tower
  },
  {
    'source': [Arcana.hierophant, Arcana.moon],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.hierophant, Arcana.sun],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.hierophant, Arcana.judgement],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.lovers, Arcana.lovers],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.lovers, Arcana.chariot],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.lovers, Arcana.justice],
    'result': Arcana.judgement
  },
  {
    'source': [Arcana.lovers, Arcana.hermit],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.lovers, Arcana.fortune],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.lovers, Arcana.strength],
    'result': Arcana.death
  },
  {
    'source': [Arcana.lovers, Arcana.hanged],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.lovers, Arcana.death],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.lovers, Arcana.temperance],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.lovers, Arcana.devil],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.lovers, Arcana.tower],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.lovers, Arcana.star],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.lovers, Arcana.moon],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.lovers, Arcana.sun],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.lovers, Arcana.judgement],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.chariot, Arcana.chariot],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.chariot, Arcana.justice],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.chariot, Arcana.hermit],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.chariot, Arcana.fortune],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.chariot, Arcana.strength],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.chariot, Arcana.hanged],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.chariot, Arcana.death],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.chariot, Arcana.temperance],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.chariot, Arcana.devil],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.chariot, Arcana.tower],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.chariot, Arcana.star],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.chariot, Arcana.moon],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.chariot, Arcana.sun],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.justice, Arcana.justice],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.justice, Arcana.hermit],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.justice, Arcana.fortune],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.justice, Arcana.strength],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.justice, Arcana.hanged],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.justice, Arcana.death],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.justice, Arcana.temperance],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.justice, Arcana.devil],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.justice, Arcana.tower],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.justice, Arcana.star],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.justice, Arcana.moon],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.justice, Arcana.sun],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.hermit, Arcana.hermit],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.hermit, Arcana.fortune],
    'result': Arcana.star
  },
  {
    'source': [Arcana.hermit, Arcana.strength],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.hermit, Arcana.hanged],
    'result': Arcana.star
  },
  {
    'source': [Arcana.hermit, Arcana.death],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.hermit, Arcana.temperance],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.hermit, Arcana.devil],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.hermit, Arcana.tower],
    'result': Arcana.judgement
  },
  {
    'source': [Arcana.hermit, Arcana.star],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.hermit, Arcana.moon],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.hermit, Arcana.sun],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.hermit, Arcana.judgement],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.fortune, Arcana.fortune],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.fortune, Arcana.strength],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.fortune, Arcana.hanged],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.fortune, Arcana.death],
    'result': Arcana.star
  },
  {
    'source': [Arcana.fortune, Arcana.temperance],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.fortune, Arcana.devil],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.fortune, Arcana.tower],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.fortune, Arcana.star],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.fortune, Arcana.moon],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.fortune, Arcana.sun],
    'result': Arcana.star
  },
  {
    'source': [Arcana.fortune, Arcana.judgement],
    'result': Arcana.tower
  },
  {
    'source': [Arcana.strength, Arcana.strength],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.strength, Arcana.hanged],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.strength, Arcana.death],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.strength, Arcana.temperance],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.strength, Arcana.devil],
    'result': Arcana.death
  },
  {
    'source': [Arcana.strength, Arcana.tower],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.strength, Arcana.star],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.strength, Arcana.moon],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.strength, Arcana.sun],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.hanged, Arcana.hanged],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.hanged, Arcana.death],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.hanged, Arcana.temperance],
    'result': Arcana.death
  },
  {
    'source': [Arcana.hanged, Arcana.devil],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.hanged, Arcana.tower],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.hanged, Arcana.star],
    'result': Arcana.justice
  },
  {
    'source': [Arcana.hanged, Arcana.moon],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.hanged, Arcana.sun],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.hanged, Arcana.judgement],
    'result': Arcana.star
  },
  {
    'source': [Arcana.death, Arcana.death],
    'result': Arcana.death
  },
  {
    'source': [Arcana.death, Arcana.temperance],
    'result': Arcana.hanged
  },
  {
    'source': [Arcana.death, Arcana.devil],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.death, Arcana.tower],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.death, Arcana.star],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.death, Arcana.moon],
    'result': Arcana.hierophant
  },
  {
    'source': [Arcana.death, Arcana.sun],
    'result': Arcana.priestess
  },
  {
    'source': [Arcana.temperance, Arcana.temperance],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.temperance, Arcana.devil],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.temperance, Arcana.tower],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.temperance, Arcana.star],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.temperance, Arcana.moon],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.temperance, Arcana.sun],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.temperance, Arcana.judgement],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.devil, Arcana.devil],
    'result': Arcana.devil
  },
  {
    'source': [Arcana.devil, Arcana.tower],
    'result': Arcana.magician
  },
  {
    'source': [Arcana.devil, Arcana.star],
    'result': Arcana.strength
  },
  {
    'source': [Arcana.devil, Arcana.moon],
    'result': Arcana.chariot
  },
  {
    'source': [Arcana.devil, Arcana.sun],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.devil, Arcana.judgement],
    'result': Arcana.lovers
  },
  {
    'source': [Arcana.tower, Arcana.tower],
    'result': Arcana.tower
  },
  {
    'source': [Arcana.tower, Arcana.star],
    'result': Arcana.death
  },
  {
    'source': [Arcana.tower, Arcana.moon],
    'result': Arcana.hermit
  },
  {
    'source': [Arcana.tower, Arcana.sun],
    'result': Arcana.emperor
  },
  {
    'source': [Arcana.tower, Arcana.judgement],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.star, Arcana.star],
    'result': Arcana.star
  },
  {
    'source': [Arcana.star, Arcana.moon],
    'result': Arcana.temperance
  },
  {
    'source': [Arcana.star, Arcana.sun],
    'result': Arcana.judgement
  },
  {
    'source': [Arcana.star, Arcana.judgement],
    'result': Arcana.fortune
  },
  {
    'source': [Arcana.moon, Arcana.moon],
    'result': Arcana.moon
  },
  {
    'source': [Arcana.moon, Arcana.sun],
    'result': Arcana.empress
  },
  {
    'source': [Arcana.moon, Arcana.judgement],
    'result': Arcana.fool
  },
  {
    'source': [Arcana.sun, Arcana.sun],
    'result': Arcana.sun
  },
  {
    'source': [Arcana.sun, Arcana.judgement],
    'result': Arcana.death
  },
  {
    'source': [Arcana.judgement, Arcana.judgement],
    'result': Arcana.judgement
  }
];

const specialCombos = [
  {
    'result': 'Alice',
    'sources': ['Nebiros', 'Belial']
  },
  {
    'result': 'Ardha',
    'sources': ['Parvati', 'Shiva']
  },
  {
    'result': 'Asura-Ou',
    'sources': ['Zouchouten', 'Jikokuten', 'Koumokuten', 'Bishamonten']
  },
  {
    'result': 'Black Frost',
    'sources': ['Jack-o\'-Lantern', 'Jack Frost', 'King Frost']
  },
  {
    'result': 'Bugs',
    'sources': ['Pixie', 'Pisaca', 'Hariti']
  },
  {
    'result': 'Chi You',
    'sources': [
      'Hecatoncheires',
      'White Rider',
      'Thor',
      'Yoshitsune',
      'Cu Chulainn'
    ]
  },
  {
    'result': 'Flauros',
    'sources': ['Berith', 'Andras', 'Eligor']
  },
  {
    'result': 'Kohryu',
    'sources': ['Genbu', 'Seiryu', 'Suzaku', 'Byakko']
  },
  {
    'result': 'Lucifer',
    'sources': ['Anubis', 'Ananta', 'Trumpeter', 'Michael', 'Metatron', 'Satan']
  },
  {
    'result': 'Metatron',
    'sources': [
      'Principality',
      'Power',
      'Dominion',
      'Melchizedek',
      'Sandalphon',
      'Michael'
    ]
  },
  {
    'result': 'Michael',
    'sources': ['Raphael', 'Gabriel', 'Uriel']
  },
  {
    'result': 'Neko Shogun',
    'sources': ['Kodama', 'Sudama', 'Anzu']
  },
  {
    'result': 'Ongyo-Ki',
    'sources': ['Kin-Ki', 'Sui-Ki', 'Fuu-Ki']
  },
  {
    'result': 'Satanael',
    'sources': ['Arsene', 'Anzu', 'Ishtar', 'Satan', 'Lucifer', 'Michael']
  },
  {
    'result': 'Seth',
    'sources': ['Isis', 'Thoth', 'Anubis', 'Horus']
  },
  {
    'result': 'Shiva',
    'sources': ['Rangda', 'Barong']
  },
  {
    'result': 'Sraosha',
    'sources': ['Mitra', 'Mithras', 'Melchizedek', 'Lilith', 'Gabriel']
  },
  {
    'result': 'Throne',
    'sources': ['Power', 'Melchizedek', 'Dominion']
  },
  {
    'result': 'Trumpeter',
    'sources': ['White Rider', 'Red Rider', 'Black Rider', 'Pale Rider']
  },
  {
    'result': 'Vasuki',
    'sources': ['Naga', 'Raja Naga', 'Ananta']
  },
  {
    'result': 'Yoshitsune',
    'sources': [
      'Okuninushi',
      'Shiki-Ouji',
      'Arahabaki',
      'Yatagarasu',
      'Futsunushi'
    ]
  }
];
