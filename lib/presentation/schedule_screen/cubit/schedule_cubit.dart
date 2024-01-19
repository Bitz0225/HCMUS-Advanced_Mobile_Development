import 'package:auto_route/auto_route.dart';
import 'package:lettutor/common/config/navigation_event.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/cancel_input_form.dart';
import 'package:lettutor/core/data_source/network/models/input/feedback_input_form.dart';
import 'package:lettutor/core/data_source/network/models/input/report_history_input_form.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/repository/booking_repository/booking_repository.dart';
import 'package:lettutor/core/repository/lesson_report_repository/lesson_report_repository.dart';
import 'package:lettutor/core/repository/user_repository/user_repository.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_state.dart';

class ScheduleCubit extends WidgetCubit<ScheduleState> {
  ScheduleCubit()
      : super(
            initialState: const ScheduleState(),
            parseJsonFunction: ScheduleState.fromJson);

  @override
  Future<void> init() async {
    await getBookedSchedule(1);
  }

  Future<void> getBookedSchedule(int page) async {
    showLoading();
    final response =
        await getIt.get<BookingRepository>().getBookedSchedule(page: page);
    if (response is DataSuccess) {
      emit(state.copyWith(
          bookedScheduleOutput: response.data,
          totalSchedulePages: ((response.data?.data?.count ?? 0) / 15).ceil()));
    } else {
      emit(state.copyWith());
    }
    hideLoading();
  }

  Future<void> setCurrentBookedSchedule(
      BookedScheduleRow? bookedSchedule) async {
    emit(state.copyWith(currentBookedSchedule: bookedSchedule));
  }

  Future<void> cancelBookedSchedule(
      {required int cancelReasonId,
      BookedScheduleRow? data,
      String? note}) async {
    final input = CancelBookedScheduleInput(
      scheduleDetailId: data?.id ?? '',
      cancelInfo: CancelInfo(
        cancelReasonId: cancelReasonId,
        note: note,
      ),
    );
    if (DateTime.now().add(const Duration(hours: 2)).isAfter(
        DateTime.fromMillisecondsSinceEpoch(
            data?.scheduleDetailInfo?.startPeriodTimestamp ?? 0))) {
      showSnackBar('You can only cancel booking 2 hours prior');
      return;
    }
    showLoading();
    final response = await getIt.get<BookingRepository>().cancelSchedule(input);
    if (response is DataSuccess) {
      showSnackBar('Cancel booking successfully',
          snackBarType: SnackBarType.success);
      await getBookedSchedule(1);
    } else {
      showSnackBar('Cancel booking failed');
    }
    hideLoading();
  }

  Future<void> getHistory(int page) async {
    showLoading();
    final response = await getIt
        .get<BookingRepository>()
        .getBookedSchedule(page: page, isFuture: false, isAsc: false);
    if (response is DataSuccess) {
      emit(state.copyWith(
          bookedHistoryOutput: response.data,
          totalHistoryPages: ((response.data?.data?.count ?? 0) / 15).ceil(),
          currentHistoryPages: page));
    } else {
      emit(state.copyWith());
    }
    hideLoading();
  }

  Future<void> setCurrentBookedHistory(
      BookedScheduleRow? bookedSchedule) async {
    emit(state.copyWith(currentBookedHistory: bookedSchedule));
  }

  Future<void> setCurrentHistoryPages(int page) async {
    emit(state.copyWith(currentHistoryPages: page));
  }

  Future<void> rateBookedHistory(
      {required String bookingId,
      required int rating,
      required String userId,
      String? content}) async {
    final input = FeedbackInputForm(
      bookingId: bookingId,
      content: content,
      rating: rating,
      userId: userId,
    );
    showLoading();
    final response = await getIt.get<UserRepository>().feedbackTutor(input);
    if (response is DataSuccess) {
      showSnackBar('Your feedback has been recorded',
          snackBarType: SnackBarType.success);
    } else {
      showSnackBar('Error occurred!');
    }
    hideLoading();
  }

  Future<void> reportBookedHistory(
      {required String bookingId,
      required String userId,
        required int reportReasonId,
      String? note}) async {
    final input = ReportHistoryInputForm(
      bookingId: bookingId,
      note: note,
      reasonId: reportReasonId,
      userId: userId,
    );
    showLoading();
    final response = await getIt.get<LessonReportRepository>().reportHistory(input);
    if (response is DataSuccess) {
      showSnackBar('Your report has been recorded',
          snackBarType: SnackBarType.success);
    } else {
      showSnackBar('Error occurred!');
    }
    hideLoading();
  }
}
