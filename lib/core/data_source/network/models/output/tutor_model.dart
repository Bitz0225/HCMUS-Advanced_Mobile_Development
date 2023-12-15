class TutorList {
  final Tutors? tutors;
  final List<FavoriteTutor>? favoriteTutor;

  TutorList({
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
}

class FavoriteTutor {
  final String? id;
  final String? firstId;
  final String? secondId;
  final String? createdAt;
  final String? updatedAt;
  final Info? secondInfo;

  FavoriteTutor({
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
}

class Info {
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

  Info({
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
}

class TutorInfo {
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

  TutorInfo({
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
}

class Tutors {
  final int? count;
  final List<Row>? rows;

  Tutors({
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
}

class Row {
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

  Row({
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
}

class Feedback {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final int? rating;
  final String? content;
  final String? createdAt;
  final String? updatedAt;
  final Info? firstInfo;

  Feedback({
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
}
