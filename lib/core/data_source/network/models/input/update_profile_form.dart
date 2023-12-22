class UpdateProfileForm {
  final String? name;
  final String? country;
  final String? phone;
  final String? birthday;
  final String? level;
  final List<String>? learnTopics;
  final List<String>? testPreparations;
  final String? studySchedule;

  const UpdateProfileForm({
    this.name,
    this.country,
    this.phone,
    this.birthday,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.studySchedule,
  });

  factory UpdateProfileForm.fromJson(Map<String, dynamic> json) {
    return UpdateProfileForm(
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      birthday: json['birthday'] as String?,
      level: json['level'] as String?,
      studySchedule: json['studySchedule'] as String?,
      learnTopics: json['learnTopics'] != null
          ? (json['learnTopics'] as List<dynamic>).map((e) => e as String).toList()
          : null,
      testPreparations: json['testPreparations'] != null
          ? (json['testPreparations'] as List<dynamic>).map((e) => e as String).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'phone': phone,
      'birthday': birthday,
      'level': level,
      'studySchedule': studySchedule,
      'learnTopics': learnTopics,
      'testPreparations': testPreparations,
    };
  }

  UpdateProfileForm copyWith({
    String? name,
    String? country,
    String? phone,
    String? birthday,
    String? level,
    String? studySchedule,
    List<String>? learnTopics,
    List<String>? testPreparations,
  }) {
    return UpdateProfileForm(
      name: name ?? this.name,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      level: level ?? this.level,
      studySchedule: studySchedule ?? this.studySchedule,
      learnTopics: learnTopics ?? this.learnTopics,
      testPreparations: testPreparations ?? this.testPreparations,
    );
  }
}
