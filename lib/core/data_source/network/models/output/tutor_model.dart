import 'package:lettutor/core/data_source/network/models/base_model.dart';

class TutorList extends BaseModel {
  final Tutors? tutors;
  final List<FavoriteTutor>? favoriteTutor;

  const TutorList({
    this.tutors,
    this.favoriteTutor,
  });

  TutorList copyWith({
    Tutors? tutors,
    List<FavoriteTutor>? favoriteTutor,
  }) =>
      TutorList(
        tutors: tutors ?? this.tutors,
        favoriteTutor: favoriteTutor ?? this.favoriteTutor,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [tutors, favoriteTutor];

  factory TutorList.fromJson(Map<String, dynamic> json) {
    return TutorList(
      tutors: json['tutors'] != null
          ? Tutors.fromJson(json['tutors'] as Map<String, dynamic>)
          : null,
      favoriteTutor: json['favoriteTutor'] != null
          ? (json['favoriteTutor'] as List)
              .map((e) => FavoriteTutor.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'tutors': tutors?.toJson(),
      'favoriteTutor': favoriteTutor?.map((e) => e.toJson()).toList(),
    };
  }
}

class FavoriteTutor extends BaseModel {
  final String? id;
  final String? firstId;
  final String? secondId;
  final String? createdAt;
  final String? updatedAt;
  final Info? secondInfo;

  const FavoriteTutor({
    this.id,
    this.firstId,
    this.secondId,
    this.createdAt,
    this.updatedAt,
    this.secondInfo,
  });

  FavoriteTutor copyWith({
    String? id,
    String? firstId,
    String? secondId,
    String? createdAt,
    String? updatedAt,
    Info? secondInfo,
  }) =>
      FavoriteTutor(
        id: id ?? this.id,
        firstId: firstId ?? this.firstId,
        secondId: secondId ?? this.secondId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        secondInfo: secondInfo ?? this.secondInfo,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstId,
        secondId,
        createdAt,
        updatedAt,
        secondInfo,
      ];

  factory FavoriteTutor.fromJson(Map<String, dynamic> json) {
    return FavoriteTutor(
      id: json['id'] as String?,
      firstId: json['firstId'] as String?,
      secondId: json['secondId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      secondInfo: json['secondInfo'] != null
          ? Info.fromJson(json['secondInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstId': firstId,
      'secondId': secondId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'secondInfo': secondInfo?.toJson(),
    };
  }
}

class Info extends BaseModel {
  final String? id;
  final String? level;
  final String? email;
  final String? google;
  final String? facebook;
  final String? apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final bool? isPhoneActivated;
  final String? requireNote;
  final int? timezone;
  final dynamic phoneAuth;
  final bool? isPhoneAuthActivated;
  final String? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final String? zaloUserId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? studentGroupId;
  final TutorInfo? tutorInfo;

  const Info({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.zaloUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.tutorInfo,
  });

  Info copyWith({
    String? id,
    String? level,
    String? email,
    String? google,
    String? facebook,
    String? apple,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    bool? isPhoneActivated,
    String? requireNote,
    int? timezone,
    dynamic phoneAuth,
    bool? isPhoneAuthActivated,
    String? studySchedule,
    bool? canSendMessage,
    bool? isPublicRecord,
    String? caredByStaffId,
    String? zaloUserId,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? studentGroupId,
    TutorInfo? tutorInfo,
  }) =>
      Info(
        id: id ?? this.id,
        level: level ?? this.level,
        email: email ?? this.email,
        google: google ?? this.google,
        facebook: facebook ?? this.facebook,
        apple: apple ?? this.apple,
        avatar: avatar ?? this.avatar,
        name: name ?? this.name,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        language: language ?? this.language,
        birthday: birthday ?? this.birthday,
        requestPassword: requestPassword ?? this.requestPassword,
        isActivated: isActivated ?? this.isActivated,
        isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
        requireNote: requireNote ?? this.requireNote,
        timezone: timezone ?? this.timezone,
        phoneAuth: phoneAuth ?? this.phoneAuth,
        isPhoneAuthActivated: isPhoneAuthActivated ?? this.isPhoneAuthActivated,
        studySchedule: studySchedule ?? this.studySchedule,
        canSendMessage: canSendMessage ?? this.canSendMessage,
        isPublicRecord: isPublicRecord ?? this.isPublicRecord,
        caredByStaffId: caredByStaffId ?? this.caredByStaffId,
        zaloUserId: zaloUserId ?? this.zaloUserId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        studentGroupId: studentGroupId ?? this.studentGroupId,
        tutorInfo: tutorInfo ?? this.tutorInfo,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        level,
        email,
        google,
        facebook,
        apple,
        avatar,
        name,
        country,
        phone,
        language,
        birthday,
        requestPassword,
        isActivated,
        isPhoneActivated,
        requireNote,
        timezone,
        phoneAuth,
        isPhoneAuthActivated,
        studySchedule,
        canSendMessage,
        isPublicRecord,
        caredByStaffId,
        zaloUserId,
        createdAt,
        updatedAt,
        deletedAt,
        studentGroupId,
        tutorInfo,
      ];

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json['id'] as String?,
      level: json['level'] as String?,
      email: json['email'] as String?,
      google: json['google'] as String?,
      facebook: json['facebook'] as String?,
      apple: json['apple'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      requestPassword: json['requestPassword'] as bool?,
      isActivated: json['isActivated'] as bool?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      requireNote: json['requireNote'] as String?,
      timezone: json['timezone'] as int?,
      phoneAuth: json['phoneAuth'] as dynamic,
      isPhoneAuthActivated: json['isPhoneAuthActivated'] as bool?,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
      isPublicRecord: json['isPublicRecord'] as bool?,
      caredByStaffId: json['caredByStaffId'] as String?,
      zaloUserId: json['zaloUserId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      studentGroupId: json['studentGroupId'] as String?,
      tutorInfo: json['tutorInfo'] != null
          ? TutorInfo.fromJson(json['tutorInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'level': level,
      'email': email,
      'google': google,
      'facebook': facebook,
      'apple': apple,
      'avatar': avatar,
      'name': name,
      'country': country,
      'phone': phone,
      'language': language,
      'birthday': birthday,
      'requestPassword': requestPassword,
      'isActivated': isActivated,
      'isPhoneActivated': isPhoneActivated,
      'requireNote': requireNote,
      'timezone': timezone,
      'phoneAuth': phoneAuth,
      'isPhoneAuthActivated': isPhoneAuthActivated,
      'studySchedule': studySchedule,
      'canSendMessage': canSendMessage,
      'isPublicRecord': isPublicRecord,
      'caredByStaffId': caredByStaffId,
      'zaloUserId': zaloUserId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'studentGroupId': studentGroupId,
      'tutorInfo': tutorInfo?.toJson(),
    };
  }
}

class TutorInfo extends BaseModel {
  final String? id;
  final String? userId;
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
  final String? createdAt;
  final String? updatedAt;

  const TutorInfo({
    this.id,
    this.userId,
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
    this.createdAt,
    this.updatedAt,
  });

  TutorInfo copyWith({
    String? id,
    String? userId,
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
    String? createdAt,
    String? updatedAt,
  }) =>
      TutorInfo(
        id: id ?? this.id,
        userId: userId ?? this.userId,
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
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        userId,
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
        createdAt,
        updatedAt,
      ];

  factory TutorInfo.fromJson(Map<String, dynamic> json) {
    return TutorInfo(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
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
      rating: (json['rating'] as num?)?.toDouble(),
      isActivated: json['isActivated'] as bool?,
      isNative: json['isNative'] as bool?,
      youtubeVideoId: json['youtubeVideoId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class Tutors extends BaseModel {
  final int? count;
  final List<Row>? rows;

  const Tutors({
    this.count,
    this.rows,
  });

  Tutors copyWith({
    int? count,
    List<Row>? rows,
  }) =>
      Tutors(
        count: count ?? this.count,
        rows: rows ?? this.rows,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        count,
        rows,
      ];

  factory Tutors.fromJson(Map<String, dynamic> json) {
    return Tutors(
      count: json['count'] as int?,
      rows: json['rows'] != null
          ? (json['rows'] as List)
              .map((e) => Row.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rows': rows?.map((e) => e.toJson()).toList(),
    };
  }
}

class Row extends BaseModel {
  final String? level;
  final String? email;
  final String? google;
  final String? facebook;
  final String? apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final bool? isPhoneActivated;
  final String? requireNote;
  final int? timezone;
  final dynamic phoneAuth;
  final bool? isPhoneAuthActivated;
  final String? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final String? zaloUserId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? studentGroupId;
  final List<Feedback>? feedbacks;
  final String? id;
  final String? userId;
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
  final bool? isNative;
  final String? youtubeVideoId;
  final int? price;
  final bool? isOnline;

  const Row({
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.zaloUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.feedbacks,
    this.id,
    this.userId,
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
    this.isNative,
    this.youtubeVideoId,
    this.price,
    this.isOnline,
  });

  Row copyWith({
    String? level,
    String? email,
    String? google,
    String? facebook,
    String? apple,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    bool? isPhoneActivated,
    String? requireNote,
    int? timezone,
    String? phoneAuth,
    bool? isPhoneAuthActivated,
    String? studySchedule,
    bool? canSendMessage,
    bool? isPublicRecord,
    String? caredByStaffId,
    String? zaloUserId,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? studentGroupId,
    List<Feedback>? feedbacks,
    String? id,
    String? userId,
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
    bool? isNative,
    String? youtubeVideoId,
    int? price,
    bool? isOnline,
  }) =>
      Row(
        level: level ?? this.level,
        email: email ?? this.email,
        google: google ?? this.google,
        facebook: facebook ?? this.facebook,
        apple: apple ?? this.apple,
        avatar: avatar ?? this.avatar,
        name: name ?? this.name,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        language: language ?? this.language,
        birthday: birthday ?? this.birthday,
        requestPassword: requestPassword ?? this.requestPassword,
        isActivated: isActivated ?? this.isActivated,
        isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
        requireNote: requireNote ?? this.requireNote,
        timezone: timezone ?? this.timezone,
        phoneAuth: phoneAuth ?? this.phoneAuth,
        isPhoneAuthActivated: isPhoneAuthActivated ?? this.isPhoneAuthActivated,
        studySchedule: studySchedule ?? this.studySchedule,
        canSendMessage: canSendMessage ?? this.canSendMessage,
        isPublicRecord: isPublicRecord ?? this.isPublicRecord,
        caredByStaffId: caredByStaffId ?? this.caredByStaffId,
        zaloUserId: zaloUserId ?? this.zaloUserId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        studentGroupId: studentGroupId ?? this.studentGroupId,
        feedbacks: feedbacks ?? this.feedbacks,
        id: id ?? this.id,
        userId: userId ?? this.userId,
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
        isNative: isNative ?? this.isNative,
        youtubeVideoId: youtubeVideoId ?? this.youtubeVideoId,
        price: price ?? this.price,
        isOnline: isOnline ?? this.isOnline,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        level,
        email,
        google,
        facebook,
        apple,
        avatar,
        name,
        country,
        phone,
        language,
        birthday,
        requestPassword,
        isActivated,
        isPhoneActivated,
        requireNote,
        timezone,
        phoneAuth,
        isPhoneAuthActivated,
        studySchedule,
        canSendMessage,
        isPublicRecord,
        caredByStaffId,
        zaloUserId,
        createdAt,
        updatedAt,
        deletedAt,
        studentGroupId,
        feedbacks,
        id,
        userId,
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
        isNative,
        youtubeVideoId,
        price,
        isOnline,
      ];

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(
      level: json['level'] as String?,
      email: json['email'] as String?,
      google: json['google'] as String?,
      facebook: json['facebook'] as String?,
      apple: json['apple'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      requestPassword: json['requestPassword'] as bool?,
      isActivated: json['isActivated'] as bool?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      requireNote: json['requireNote'] as String?,
      timezone: json['timezone'] as int?,
      phoneAuth: json['phoneAuth'] as dynamic,
      isPhoneAuthActivated: json['isPhoneAuthActivated'] as bool?,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool?,
      isPublicRecord: json['isPublicRecord'] as bool?,
      caredByStaffId: json['caredByStaffId'] as String?,
      zaloUserId: json['zaloUserId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      studentGroupId: json['studentGroupId'] as String?,
      feedbacks: json['feedbacks'] != null
          ? (json['feedbacks'] as List)
              .map((e) => Feedback.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      id: json['id'] as String?,
      userId: json['userId'] as String?,
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
      rating: (json['rating'] as num?)?.toDouble(),
      isNative: json['isNative'] as bool?,
      youtubeVideoId: json['youtubeVideoId'] as String?,
      price: json['price'] as int?,
      isOnline: json['isOnline'] as bool?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'email': email,
      'google': google,
      'facebook': facebook,
      'apple': apple,
      'avatar': avatar,
      'name': name,
      'country': country,
      'phone': phone,
      'language': language,
      'birthday': birthday,
      'requestPassword': requestPassword,
      'isActivated': isActivated,
      'isPhoneActivated': isPhoneActivated,
      'requireNote': requireNote,
      'timezone': timezone,
      'phoneAuth': phoneAuth,
      'isPhoneAuthActivated': isPhoneAuthActivated,
      'studySchedule': studySchedule,
      'canSendMessage': canSendMessage,
      'isPublicRecord': isPublicRecord,
      'caredByStaffId': caredByStaffId,
      'zaloUserId': zaloUserId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'studentGroupId': studentGroupId,
      'feedbacks': feedbacks?.map((e) => e.toJson()).toList(),
      'id': id,
      'userId': userId,
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
      'isNative': isNative,
      'youtubeVideoId': youtubeVideoId,
      'price': price,
      'isOnline': isOnline,
    };
  }
}

class Feedback extends BaseModel {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final int? rating;
  final String? content;
  final String? createdAt;
  final String? updatedAt;
  final Info? firstInfo;

  const Feedback({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  Feedback copyWith({
    String? id,
    String? bookingId,
    String? firstId,
    String? secondId,
    int? rating,
    String? content,
    String? createdAt,
    String? updatedAt,
    Info? firstInfo,
  }) =>
      Feedback(
        id: id ?? this.id,
        bookingId: bookingId ?? this.bookingId,
        firstId: firstId ?? this.firstId,
        secondId: secondId ?? this.secondId,
        rating: rating ?? this.rating,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        firstInfo: firstInfo ?? this.firstInfo,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        bookingId,
        firstId,
        secondId,
        rating,
        content,
        createdAt,
        updatedAt,
        firstInfo,
      ];

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      id: json['id'] as String?,
      bookingId: json['bookingId'] as String?,
      firstId: json['firstId'] as String?,
      secondId: json['secondId'] as String?,
      rating: json['rating'] as int?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      firstInfo: json['firstInfo'] != null
          ? Info.fromJson(json['firstInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingId': bookingId,
      'firstId': firstId,
      'secondId': secondId,
      'rating': rating,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'firstInfo': firstInfo?.toJson(),
    };
  }
}

class TutorSearchOutput extends BaseModel {
  final int? count;
  final List<TutorSearchOutputItem>? rows;

  const TutorSearchOutput({
    this.count,
    this.rows,
  });

  TutorSearchOutput copyWith({
    int? count,
    List<TutorSearchOutputItem>? rows,
  }) =>
      TutorSearchOutput(
        count: count ?? this.count,
        rows: rows ?? this.rows,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        count,
        rows,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rows': rows?.map((e) => e.toJson()).toList(),
    };
  }

  factory TutorSearchOutput.fromJson(Map<String, dynamic> json) {
    return TutorSearchOutput(
      count: json['count'] as int?,
      rows: json['rows'] != null
          ? (json['rows'] as List)
              .map((e) => TutorSearchOutputItem.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}

class TutorSearchOutputItem extends BaseModel {
  final String? avatar;
  final String? bio;
  final String? country;
  final String? id;
  final bool? isFavoriteTutor;
  final bool? isNative;
  final String? name;
  final int? price;
  final double? rating;
  final int? scheduleTimes;
  final String? specialities;

  const TutorSearchOutputItem({
    this.avatar,
    this.bio,
    this.country,
    this.id,
    this.isFavoriteTutor,
    this.isNative,
    this.name,
    this.price,
    this.rating,
    this.scheduleTimes,
    this.specialities,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        avatar,
        bio,
        country,
        id,
        isFavoriteTutor,
        isNative,
        name,
        price,
        rating,
        scheduleTimes,
        specialities,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'bio': bio,
      'country': country,
      'id': id,
      'isFavoriteTutor': isFavoriteTutor,
      'isNative': isNative,
      'name': name,
      'price': price,
      'rating': rating,
      'scheduleTimes': scheduleTimes,
      'specialties': specialities,
    };
  }

  factory TutorSearchOutputItem.fromJson(Map<String, dynamic> json) {
    return TutorSearchOutputItem(
      avatar: json['avatar'] as String?,
      bio: json['bio'] as String?,
      country: json['country'] as String?,
      id: json['id'] as String?,
      isFavoriteTutor: json['isFavoriteTutor'] as bool?,
      isNative: json['isNative'] as bool?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      rating: json['rating'] as double?,
      scheduleTimes: json['schedulesTimes'] as int?,
      specialities: json['specialties'] as String?,
    );
  }

  TutorSearchOutputItem copyWith({
    String? avatar,
    String? bio,
    String? country,
    String? id,
    bool? isFavoriteTutor,
    bool? isNative,
    String? name,
    int? price,
    double? rating,
    int? scheduleTimes,
    String? specialities,
    String? userId,
  }) =>
      TutorSearchOutputItem(
        avatar: avatar ?? this.avatar,
        bio: bio ?? this.bio,
        country: country ?? this.country,
        id: id ?? this.id,
        isFavoriteTutor: isFavoriteTutor ?? this.isFavoriteTutor,
        isNative: isNative ?? this.isNative,
        name: name ?? this.name,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        scheduleTimes: scheduleTimes ?? this.scheduleTimes,
        specialities: specialities ?? this.specialities,
      );
}
