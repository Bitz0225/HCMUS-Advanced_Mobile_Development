import 'package:lettutor/core/data_source/network/models/base_model.dart';
import 'package:lettutor/core/data_source/network/models/output/course_model.dart';

class AuthOutput extends BaseModel{
  final User? user;
  final Tokens? tokens;

  AuthOutput({
    this.user,
    this.tokens,
  });

  AuthOutput copyWith({
    User? user,
    Tokens? tokens,
  }) =>
      AuthOutput(
        user: user ?? this.user,
        tokens: tokens ?? this.tokens,
      );

  @override
  factory AuthOutput.fromJson(Map<String, dynamic> json) {
    return AuthOutput(
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      tokens: json['tokens'] != null
          ? Tokens.fromJson(json['tokens'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'tokens': tokens?.toJson(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    user,
    tokens,
  ];
}

class Tokens extends BaseModel {
  final Access? access;
  final Access? refresh;

  Tokens({
    this.access,
    this.refresh,
  });

  Tokens copyWith({
    Access? access,
    Access? refresh,
  }) =>
      Tokens(
        access: access ?? this.access,
        refresh: refresh ?? this.refresh,
      );

  @override
  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      access: json['access'] != null
          ? Access.fromJson(json['access'] as Map<String, dynamic>)
          : null,
      refresh: json['refresh'] != null
          ? Access.fromJson(json['refresh'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'access': access?.toJson(),
      'refresh': refresh?.toJson(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    access,
    refresh,
  ];
}

class Access extends BaseModel{
  final String? token;
  final String? expires;

  Access({
    this.token,
    this.expires,
  });

  Access copyWith({
    String? token,
    String? expires,
  }) =>
      Access(
        token: token ?? this.token,
        expires: expires ?? this.expires,
      );

  @override
  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(
      token: json['token'] as String?,
      expires: json['expires'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expires': expires,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    token,
    expires,
  ];
}

class Message extends BaseModel {
  final String? message;

  Message({
    this.message,
  });

  Message copyWith({
    String? message,
  }) =>
      Message(
        message: message ?? this.message,
      );

  @override
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    message,
  ];
}

class User extends BaseModel {
  final String? id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? country;
  final String? phone;
  final List<String>? roles;
  final String? language;
  final String? birthday;
  final bool? isActivated;
  final TutorInfo? tutorInfo;
  final WalletInfo? walletInfo;
  final List<Course>? courses;
  final String? requireNote;
  final String? level;
  final List<TestPreparation>? learnTopics;
  final List<TestPreparation>? testPreparations;
  final bool? isPhoneActivated;
  final int? timezone;
  final ReferralInfo? referralInfo;
  final String? studySchedule;
  final bool? canSendMessage;
  final List<dynamic>? studentGroup;
  final String? studentInfo;
  final double? avgRating;

  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.tutorInfo,
    this.walletInfo,
    this.courses,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.referralInfo,
    this.studySchedule,
    this.canSendMessage,
    this.studentGroup,
    this.studentInfo,
    this.avgRating,
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
    TutorInfo? tutorInfo,
    WalletInfo? walletInfo,
    List<Course>? courses,
    String? requireNote,
    String? level,
    List<TestPreparation>? learnTopics,
    List<TestPreparation>? testPreparations,
    bool? isPhoneActivated,
    int? timezone,
    ReferralInfo? referralInfo,
    String? studySchedule,
    bool? canSendMessage,
    List<dynamic>? studentGroup,
    String? studentInfo,
    double? avgRating,
  }) =>
      User(
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
        tutorInfo: tutorInfo ?? this.tutorInfo,
        walletInfo: walletInfo ?? this.walletInfo,
        courses: courses ?? this.courses,
        requireNote: requireNote ?? this.requireNote,
        level: level ?? this.level,
        learnTopics: learnTopics ?? this.learnTopics,
        testPreparations: testPreparations ?? this.testPreparations,
        isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
        timezone: timezone ?? this.timezone,
        referralInfo: referralInfo ?? this.referralInfo,
        studySchedule: studySchedule ?? this.studySchedule,
        canSendMessage: canSendMessage ?? this.canSendMessage,
        studentGroup: studentGroup ?? this.studentGroup,
        studentInfo: studentInfo ?? this.studentInfo,
        avgRating: avgRating ?? this.avgRating,
      );

  @override
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      roles: json['roles'] != null
          ? (json['roles'] as List).map((e) => e as String).toList()
          : null,
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      isActivated: json['isActivated'] as bool?,
      tutorInfo: json['tutorInfo'] != null
          ? TutorInfo.fromJson(json['tutorInfo'] as Map<String, dynamic>)
          : null,
      walletInfo: json['walletInfo'] != null
          ? WalletInfo.fromJson(json['walletInfo'] as Map<String, dynamic>)
          : null,
      courses: json['courses'] != null
          ? (json['courses'] as List)
              .map((e) => Course.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      requireNote: json['requireNote'] as String?,
      level: json['level'] as String?,
      learnTopics: json['learnTopics'] != null
          ? (json['learnTopics'] as List)
              .map((e) => TestPreparation.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      testPreparations: json['testPreparations'] != null
          ? (json['testPreparations'] as List)
              .map((e) => TestPreparation.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      timezone: json['timezone'] as int?,
      referralInfo: json['referralInfo'] != null
          ? ReferralInfo.fromJson(json['referralInfo'] as Map<String, dynamic>)
          : null,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
      studentGroup: json['studentGroup'] as List<dynamic>?,
      studentInfo: json['studentInfo'] as String?,
      avgRating: json['avgRating'] as double?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'country': country,
      'phone': phone,
      'roles': roles,
      'language': language,
      'birthday': birthday,
      'isActivated': isActivated,
      'tutorInfo': tutorInfo?.toJson(),
      'walletInfo': walletInfo?.toJson(),
      'requireNote': requireNote,
      'level': level,
      'learnTopics': learnTopics,
      'testPreparations':
          testPreparations?.map((e) => e.toJson()).toList(),
      'isPhoneActivated': isPhoneActivated,
      'timezone': timezone,
      'referralInfo': referralInfo?.toJson(),
      'studySchedule': studySchedule,
      'canSendMessage': canSendMessage,
      'studentGroup': studentGroup,
      'studentInfo': studentInfo,
      'avgRating': avgRating,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    email,
    name,
    avatar,
    country,
    phone,
    roles,
    language,
    birthday,
    isActivated,
    tutorInfo,
    walletInfo,
    courses,
    requireNote,
    level,
    learnTopics,
    testPreparations,
    isPhoneActivated,
    timezone,
    referralInfo,
    studySchedule,
    canSendMessage,
    studentGroup,
    studentInfo,
    avgRating,
  ];
}

class ReferralInfo extends BaseModel {
  final String? referralCode;
  final ReferralPackInfo? referralPackInfo;

  ReferralInfo({
    this.referralCode,
    this.referralPackInfo,
  });

  ReferralInfo copyWith({
    String? referralCode,
    ReferralPackInfo? referralPackInfo,
  }) =>
      ReferralInfo(
        referralCode: referralCode ?? this.referralCode,
        referralPackInfo: referralPackInfo ?? this.referralPackInfo,
      );

  @override
  factory ReferralInfo.fromJson(Map<String, dynamic> json) {
    return ReferralInfo(
      referralCode: json['referralCode'] as String?,
      referralPackInfo: json['referralPackInfo'] != null
          ? ReferralPackInfo.fromJson(
              json['referralPackInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'referralCode': referralCode,
      'referralPackInfo': referralPackInfo?.toJson(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    referralCode,
    referralPackInfo,
  ];
}

class ReferralPackInfo extends BaseModel {
  final int? earnPercent;

  ReferralPackInfo({
    this.earnPercent,
  });

  ReferralPackInfo copyWith({
    int? earnPercent,
  }) =>
      ReferralPackInfo(
        earnPercent: earnPercent ?? this.earnPercent,
      );

  @override
  factory ReferralPackInfo.fromJson(Map<String, dynamic> json) {
    return ReferralPackInfo(
      earnPercent: json['earnPercent'] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'earnPercent': earnPercent,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    earnPercent,

  ];
}

class TestPreparation extends BaseModel {
  final int? id;
  final String? key;
  final String? name;

  TestPreparation({
    this.id,
    this.key,
    this.name,
  });

  TestPreparation copyWith({
    int? id,
    String? key,
    String? name,
  }) =>
      TestPreparation(
        id: id ?? this.id,
        key: key ?? this.key,
        name: name ?? this.name,
      );

  @override
  factory TestPreparation.fromJson(Map<String, dynamic> json) {
    return TestPreparation(
      id: json['id'] as int?,
      key: json['key'] as String?,
      name: json['name'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'name': name,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    key,
    name,
  ];
}

class TutorInfo extends BaseModel{
  final String? id;
  final String? video;
  final String? bio;
  final String? education;
  final String? experience;
  final String? profession;
  final String? accent;
  final String? targetStudent;
  final String? interests;
  final String? languages;
  final String? specialties;
  final String? resume;
  final double? rating;
  final bool? isActivated;
  final bool? isNative;
  final String? youtubeVideoId;

  const TutorInfo({
    this.id,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    this.rating,
    this.isActivated,
    this.isNative,
    this.youtubeVideoId,
  });

  TutorInfo copyWith({
    String? id,
    String? video,
    String? bio,
    String? education,
    String? experience,
    String? profession,
    String? accent,
    String? targetStudent,
    String? interests,
    String? languages,
    String? specialties,
    String? resume,
    double? rating,
    bool? isActivated,
    bool? isNative,
    String? youtubeVideoId,
  }) =>
      TutorInfo(
        id: id ?? this.id,
        video: video ?? this.video,
        bio: bio ?? this.bio,
        education: education ?? this.education,
        experience: experience ?? this.experience,
        profession: profession ?? this.profession,
        accent: accent ?? this.accent,
        targetStudent: targetStudent ?? this.targetStudent,
        interests: interests ?? this.interests,
        languages: languages ?? this.languages,
        specialties: specialties ?? this.specialties,
        resume: resume ?? this.resume,
        rating: rating ?? this.rating,
        isActivated: isActivated ?? this.isActivated,
        isNative: isNative ?? this.isNative,
        youtubeVideoId: youtubeVideoId ?? this.youtubeVideoId,
      );

  @override
  factory TutorInfo.fromJson(Map<String, dynamic> json) {
    return TutorInfo(
      id: json['id'] as String?,
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      accent: json['accent'] as String?,
      targetStudent: json['targetStudent'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      resume: json['resume'] as String?,
      rating: json['rating'] as double?,
      isActivated: json['isActivated'] as bool?,
      isNative: json['isNative'] as bool?,
      youtubeVideoId: json['youtubeVideoId'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'video': video,
      'bio': bio,
      'education': education,
      'experience': experience,
      'profession': profession,
      'accent': accent,
      'targetStudent': targetStudent,
      'interests': interests,
      'languages': languages,
      'specialties': specialties,
      'resume': resume,
      'rating': rating,
      'isActivated': isActivated,
      'isNative': isNative,
      'youtubeVideoId': youtubeVideoId,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    video,
    bio,
    education,
    experience,
    profession,
    accent,
    targetStudent,
    interests,
    languages,
    specialties,
    resume,
    rating,
    isActivated,
    isNative,
    youtubeVideoId,
  ];
}

class WalletInfo extends BaseModel {
  final String? id;
  final String? userId;
  final String? amount;
  final bool? isBlocked;
  final String? createdAt;
  final String? updatedAt;
  final int? bonus;

  const WalletInfo({
    this.id,
    this.userId,
    this.amount,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.bonus,
  });

  WalletInfo copyWith({
    String? id,
    String? userId,
    String? amount,
    bool? isBlocked,
    String? createdAt,
    String? updatedAt,
    int? bonus,
  }) =>
      WalletInfo(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        isBlocked: isBlocked ?? this.isBlocked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        bonus: bonus ?? this.bonus,
      );

  @override
  factory WalletInfo.fromJson(Map<String, dynamic> json) {
    return WalletInfo(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      amount: json['amount'] as String?,
      isBlocked: json['isBlocked'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      bonus: json['bonus'] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'isBlocked': isBlocked,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'bonus': bonus,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    userId,
    amount,
    isBlocked,
    createdAt,
    updatedAt,
    bonus,
  ];
}

class UserInfo extends BaseModel {
  final User? user;

  const UserInfo({
    this.user,
  });

  UserInfo copyWith({
    User? user,
  }) =>
      UserInfo(
        user: user ?? this.user,
      );

  @override
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    user,
  ];

}
