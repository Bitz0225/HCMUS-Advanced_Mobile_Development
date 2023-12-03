//"user": {
//         "id": "cb9e7deb-3382-48db-b07c-90acf52f541c",
//         "email": "phhai@ymail.com",
//         "name": "Phhai",
//         "avatar": "https://sandbox.api.lettutor.com/avatar/cb9e7deb-3382-48db-b07c-90acf52f541cavatar1686550060378.jpg",
//         "country": "VN",
//         "phone": "842499996508",
//         "roles": [
//             "student",
//             "CHANGE_PASSWORD"
//         ],
//         "language": null,
//         "birthday": "1999-06-01",
//         "isActivated": true,
//         "walletInfo": {
//             "id": "102ef671-a249-4d19-852e-ea23016d7d34",
//             "userId": "cb9e7deb-3382-48db-b07c-90acf52f541c",
//             "amount": "982800000",
//             "isBlocked": false,
//             "createdAt": "2021-12-18T03:55:53.522Z",
//             "updatedAt": "2023-12-01T15:45:12.600Z",
//             "bonus": 0
//         },
//         "courses": [],
//         "requireNote": "thich hoc",
//         "level": "INTERMEDIATE",
//         "learnTopics": [],
//         "testPreparations": [
//             {
//                 "id": 5,
//                 "key": "pet",
//                 "name": "PET"
//             }
//         ],
//         "isPhoneActivated": true,
//         "timezone": 7,
//         "studySchedule": "",
//         "canSendMessage": false
//     }

class User {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String country;
  final String phone;
  final List<String> roles;
  final String? language;
  final String birthday;
  final bool isActivated;
  final WalletInfo walletInfo;
  final List<Course> courses;
  final String requireNote;
  final String level;
  final List<String> learnTopics;
  final List<TestPreparation> testPreparations;
  final bool isPhoneActivated;
  final int timezone;
  final String studySchedule;
  final bool canSendMessage;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.roles,
    required this.language,
    required this.birthday,
    required this.isActivated,
    required this.walletInfo,
    required this.courses,
    required this.requireNote,
    required this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    required this.timezone,
    required this.studySchedule,
    required this.canSendMessage,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    List<String>? roles,
    String? language,
    String? birthday,
    bool? isActivated,
    WalletInfo? walletInfo,
    List<Course>? courses,
    String? requireNote,
    String? level,
    List<String>? learnTopics,
    List<TestPreparation>? testPreparations,
    bool? isPhoneActivated,
    int? timezone,
    String? studySchedule,
    bool? canSendMessage,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles,
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      isActivated: isActivated ?? this.isActivated,
      walletInfo: walletInfo ?? this.walletInfo,
      courses: courses ?? this.courses,
      requireNote: requireNote ?? this.requireNote,
      level: level ?? this.level,
      learnTopics: learnTopics ?? this.learnTopics,
      testPreparations: testPreparations ?? this.testPreparations,
      isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
      timezone: timezone ?? this.timezone,
      studySchedule: studySchedule ?? this.studySchedule,
      canSendMessage: canSendMessage ?? this.canSendMessage,
    );
  }
}