import 'package:auto_route/auto_route.dart';
import 'package:lettutor/common/config/navigation_event.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/cancel_input_form.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/repository/booking_repository/booking_repository.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_state.dart';

class ScheduleCubit extends WidgetCubit<ScheduleState> {
  ScheduleCubit() : super(initialState: const ScheduleState(), parseJsonFunction: ScheduleState.fromJson);

  @override
  Future<void> init() async {
    await getBookedSchedule(1);
  }

  Future<void> getBookedSchedule(int page) async {
    showLoading();
    final response = await getIt.get<BookingRepository>().getBookedSchedule(page);
    if (response is DataSuccess) {
      emit(state.copyWith(bookedScheduleOutput: response.data));
    } else {
      emit(state.copyWith());
    }
    hideLoading();
  }

  Future<void> setCurrentBookedSchedule(BookedScheduleRow? bookedSchedule) async {
    emit(state.copyWith(currentBookedSchedule: bookedSchedule));
  }

  Future<void> cancelBookedSchedule({required int cancelReasonId, BookedScheduleRow? data, String? note}) async {
    final input = CancelBookedScheduleInput(
      scheduleDetailId: data?.id ?? '',
      cancelInfo: CancelInfo(
        cancelReasonId: cancelReasonId,
        note: note,
      ),
    );
    if (DateTime.now().add(const Duration(hours: 2)).isAfter(DateTime.fromMillisecondsSinceEpoch(data?.scheduleDetailInfo?.startPeriodTimestamp ?? 0))) {
      showSnackBar('You can only cancel booking 2 hours prior');
      return;
    }
    showLoading();
    final response = await getIt.get<BookingRepository>().cancelSchedule(input);
    if (response is DataSuccess) {
      showSnackBar('Cancel booking successfully', snackBarType: SnackBarType.success);
      await getBookedSchedule(1);
    } else {
      showSnackBar('Cancel booking failed');
    }
    hideLoading();
  }
}
