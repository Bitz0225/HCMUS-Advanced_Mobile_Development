enum Level {
  beginner(value: 'BEGINNER', tagName: 'Pre A1 (Beginner)'),
  higherBeginner(value: 'HIGHER_BEGINNER', tagName: 'A1 (Higher Beginner)'),
  preIntermediate(value: 'PRE_INTERMEDIATE', tagName: 'A2 (Pre-Intermediate)'),
  intermediate(value: 'INTERMEDIATE', tagName: 'B1 (Intermediate)'),
  upperIntermediate(value: 'UPPER_INTERMEDIATE', tagName: 'B2 (Upper Intermediate)'),
  advanced(value: 'ADVANCED', tagName: 'C1 (Advanced)'),
  proficient(value: 'PROFICIENT', tagName: 'C2 (Proficient)'),
  upperA1(value: 'UPPER_A1', tagName: 'A1 (High Beginner)'),
  upperA2(value: 'UPPER_A2', tagName: 'A2 (Pre-Intermediate)');

  final String value;
  final String tagName;
  const Level({required this.value, required this.tagName});

  bool get isBeginner => this == Level.beginner;
  bool get isHigherBeginner => this == Level.higherBeginner;
  bool get isPreIntermediate => this == Level.preIntermediate;
  bool get isIntermediate => this == Level.intermediate;
  bool get isUpperIntermediate => this == Level.upperIntermediate;
  bool get isAdvanced => this == Level.advanced;
  bool get isProficient => this == Level.proficient;
  bool get isUpperA1 => this == Level.upperA1;
  bool get isUpperA2 => this == Level.upperA2;
}

enum Subject {
  englishForKids(key: 3, value: 'english-for-kids', tagName: 'English for Kids'),
  businessEnglish(key: 4, value: 'business-english', tagName: 'Business English'),
  conversationalEnglish(key: 5, value: 'conversational-english', tagName: 'Conversational English');

  final String value;
  final String tagName;
  final int key;
  const Subject({required this.key, required this.value, required this.tagName});

  bool get isEnglishForKids => this == Subject.englishForKids;
  bool get isBusinessEnglish => this == Subject.businessEnglish;
  bool get isConversationalEnglish => this == Subject.conversationalEnglish;
}

enum TestPreparation {
  starters(value: 'starters', tagName: 'STARTERS'),
  movers(value: 'movers', tagName: 'MOVERS'),
  flyers(value: 'flyers', tagName: 'FLYERS'),
  ket(value: 'ket', tagName: 'KET'),
  pet(value: 'pet', tagName: 'PET'),
  ielts(value: 'ielts', tagName: 'IELTS'),
  toefl(value: 'toefl', tagName: 'TOEFL'),
  toeic(value: 'toeic', tagName: 'TOEIC');

  final String value;
  final String tagName;
  const TestPreparation({required this.value, required this.tagName});

  bool get isStarters => this == TestPreparation.starters;
  bool get isMovers => this == TestPreparation.movers;
  bool get isFlyers => this == TestPreparation.flyers;
  bool get isKet => this == TestPreparation.ket;
  bool get isPet => this == TestPreparation.pet;
  bool get isIelts => this == TestPreparation.ielts;
  bool get isToefl => this == TestPreparation.toefl;
  bool get isToeic => this == TestPreparation.toeic;
}