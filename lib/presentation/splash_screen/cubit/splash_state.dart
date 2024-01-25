import 'package:lettutor/core/data_source/network/models/output/feedback_model.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

class SplashState extends WidgetState {
  final User? user;
  final bool? isLogin;
  final String? message;
  final String? passwordFormMessage;
  final String? updateProfileFormMessage;
  final bool? isProfileUpdateSuccess;
  final int? totalFeedbackPages;
  final List<FeedbackRows>? listFeedbacks;
  final BookedScheduleRow? nextSchedule;
  final int? totalLearningTime;

  const SplashState(
      {this.isLogin,
      this.message,
      this.user,
      this.passwordFormMessage,
      this.updateProfileFormMessage,
      this.isProfileUpdateSuccess,
      this.totalFeedbackPages,
      this.listFeedbacks,
      this.nextSchedule,
      this.totalLearningTime});

  @override
  // TODO: implement props
  List<Object?> get props => [
        user,
        isLogin,
        message,
        passwordFormMessage,
        updateProfileFormMessage,
        isProfileUpdateSuccess,
        totalFeedbackPages,
        listFeedbacks,
        nextSchedule,
        totalLearningTime
      ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SplashState.fromJson(Map<String, dynamic> json) {
    return SplashState(
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      isLogin: json['isLogin'] as bool?,
      message: json['message'] as String?,
      passwordFormMessage: json['passwordFormMessage'] as String?,
      updateProfileFormMessage: json['updateProfileFormMessage'] as String?,
      isProfileUpdateSuccess: json['isProfileUpdateSuccess'] as bool?,
      totalFeedbackPages: json['totalFeedbackPages'] as int?,
      listFeedbacks: json['listFeedbacks'] == null
          ? null
          : (json['listFeedbacks'] as List<dynamic>)
              .map((e) => FeedbackRows.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextSchedule: json['nextSchedule'] == null
          ? null
          : BookedScheduleRow.fromJson(
              json['nextSchedule'] as Map<String, dynamic>),
      totalLearningTime: json['totalLearningTime'] as int?,
    );
  }

  SplashState copyWith({
    User? user,
    bool? isLogin,
    String? message,
    String? passwordFormMessage,
    String? updateProfileFormMessage,
    bool? isProfileUpdateSuccess,
    int? totalFeedbackPages,
    List<FeedbackRows>? listFeedbacks,
    BookedScheduleRow? nextSchedule,
    int? totalLearningTime,
  }) {
    return SplashState(
      user: user ?? this.user,
      isLogin: isLogin ?? this.isLogin,
      message: message ?? this.message,
      passwordFormMessage: passwordFormMessage ?? this.passwordFormMessage,
      updateProfileFormMessage:
          updateProfileFormMessage ?? this.updateProfileFormMessage,
      isProfileUpdateSuccess:
          isProfileUpdateSuccess ?? this.isProfileUpdateSuccess,
      totalFeedbackPages: totalFeedbackPages ?? this.totalFeedbackPages,
      listFeedbacks: listFeedbacks ?? this.listFeedbacks,
      nextSchedule: nextSchedule,
      totalLearningTime: totalLearningTime ?? this.totalLearningTime,
    );
  }
}
