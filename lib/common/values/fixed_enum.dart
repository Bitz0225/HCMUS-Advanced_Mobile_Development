import 'package:lettutor/core/data_source/network/models/output/course_model.dart';

enum Level {
  beginner(value: 'BEGINNER', tagName: 'Pre A1 (Beginner)'),
  higherBeginner(value: 'HIGHER_BEGINNER', tagName: 'A1 (Higher Beginner)'),
  preIntermediate(value: 'PRE_INTERMEDIATE', tagName: 'A2 (Pre-Intermediate)'),
  intermediate(value: 'INTERMEDIATE', tagName: 'B1 (Intermediate)'),
  upperIntermediate(value: 'UPPER_INTERMEDIATE', tagName: 'B2 (Upper Intermediate)'),
  advanced(value: 'ADVANCED', tagName: 'C1 (Advanced)'),
  proficiency(value: 'PROFICIENCY', tagName: 'C2 (Proficiency)');

  final String value;
  final String tagName;
  const Level({required this.value, required this.tagName});

  bool get isBeginner => this == Level.beginner;
  bool get isHigherBeginner => this == Level.higherBeginner;
  bool get isPreIntermediate => this == Level.preIntermediate;
  bool get isIntermediate => this == Level.intermediate;
  bool get isUpperIntermediate => this == Level.upperIntermediate;
  bool get isAdvanced => this == Level.advanced;
  bool get isProficiency => this == Level.proficiency;
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

enum Test {
  starters(key: 1, value: 'starters', tagName: 'STARTERS'),
  movers(key: 2, value: 'movers', tagName: 'MOVERS'),
  flyers(key: 3, value: 'flyers', tagName: 'FLYERS'),
  ket(key: 4, value: 'ket', tagName: 'KET'),
  pet(key: 5, value: 'pet', tagName: 'PET'),
  ielts(key: 6, value: 'ielts', tagName: 'IELTS'),
  toefl(key: 7, value: 'toefl', tagName: 'TOEFL'),
  toeic(key: 8, value: 'toeic', tagName: 'TOEIC');

  final String value;
  final String tagName;
  final int key;
  const Test({required this.value, required this.tagName, required this.key});

  bool get isStarters => this == Test.starters;
  bool get isMovers => this == Test.movers;
  bool get isFlyers => this == Test.flyers;
  bool get isKet => this == Test.ket;
  bool get isPet => this == Test.pet;
  bool get isIelts => this == Test.ielts;
  bool get isToefl => this == Test.toefl;
  bool get isToeic => this == Test.toeic;
}

enum Tags {
  englishForKids(key: 3, value: 'english-for-kids', tagName: 'English for Kids'),
  businessEnglish(key: 4, value: 'business-english', tagName: 'Business English'),
  conversationalEnglish(key: 5, value: 'conversational-english', tagName: 'Conversational English'),
  starters(key: 1, value: 'starters', tagName: 'STARTERS'),
  movers(key: 2, value: 'movers', tagName: 'MOVERS'),
  flyers(key: 3, value: 'flyers', tagName: 'FLYERS'),
  ket(key: 4, value: 'ket', tagName: 'KET'),
  pet(key: 5, value: 'pet', tagName: 'PET'),
  ielts(key: 6, value: 'ielts', tagName: 'IELTS'),
  toefl(key: 7, value: 'toefl', tagName: 'TOEFL'),
  toeic(key: 8, value: 'toeic', tagName: 'TOEIC'),
  empty(key: 0, value: '', tagName: '');

  final String value;
  final String tagName;
  final int key;
  const Tags({required this.key, required this.value, required this.tagName});

  bool get isStarters => this == Tags.starters;
  bool get isMovers => this == Tags.movers;
  bool get isFlyers => this == Tags.flyers;
  bool get isKet => this == Tags.ket;
  bool get isPet => this == Tags.pet;
  bool get isIelts => this == Tags.ielts;
  bool get isToefl => this == Tags.toefl;
  bool get isToeic => this == Test.toeic;
  bool get isEnglishForKids => this == Tags.englishForKids;
  bool get isBusinessEnglish => this == Tags.businessEnglish;
  bool get isConversationalEnglish => this == Tags.conversationalEnglish;
}

enum CourseLevel {
  anyLevel(key: 0, value: 'ANY_LEVEL', tagName: 'Any Level'),
  beginner(key: 1, value: 'BEGINNER', tagName: 'Beginner'),
  upperBeginner(key: 2, value: 'UPPER_BEGINNER', tagName: 'Upper-Beginner'),
  preIntermediate(key: 3, value: 'PRE_INTERMEDIATE', tagName: 'Pre-Intermediate'),
  intermediate(key: 4, value: 'INTERMEDIATE', tagName: 'Intermediate'),
  upperIntermediate(key: 5, value: 'UPPER_INTERMEDIATE', tagName: 'Upper-Intermediate'),
  preAdvanced(key: 6, value: 'PRE_ADVANCED', tagName: 'Pre-Advanced'),
  advanced(key: 7, value: 'ADVANCED', tagName: 'Advanced');

  final int key;
  final String value;
  final String tagName;
  const CourseLevel({required this.key, required this.value, required this.tagName});

  bool get isAnyLevel => this == CourseLevel.anyLevel;
  bool get isBeginner => this == CourseLevel.beginner;
  bool get isUpperBeginner => this == CourseLevel.upperBeginner;
  bool get isPreIntermediate => this == CourseLevel.preIntermediate;
  bool get isIntermediate => this == CourseLevel.intermediate;
  bool get isUpperIntermediate => this == CourseLevel.upperIntermediate;
  bool get isPreAdvanced => this == CourseLevel.preAdvanced;
  bool get isAdvanced => this == CourseLevel.advanced;
}
