import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/booking_form.dart';
import 'package:lettutor/core/data_source/network/models/input/cancel_input_form.dart';
import 'package:lettutor/core/data_source/network/models/output/booking_model.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class BookingRepository extends BaseRepository {
  BookingRepository() : super('/booking');

  Future<DataState<BookingOutput>> bookSchedule(BookingInputForm input) async {
    return post<BookingOutput>(
      path: '',
      parseJsonFunction: BookingOutput.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<BookedScheduleOutput>> getBookedSchedule({required int page, bool? isFuture = true, bool? isAsc = true}) async {
    return get<BookedScheduleOutput>(
      path: '/list/student',
      parseJsonFunction: BookedScheduleOutput.fromJson,
      queryParameters: {
        'page': page,
        'perPage': 15,
        'inFuture': (isFuture ?? true) ? 1 : 0,
        'orderBy': 'meeting',
        'sortBy': (isAsc ?? true) ? 'asc' : 'desc'
      },
    );
  }

  Future<DataState<BookedScheduleMessage>> cancelSchedule(CancelBookedScheduleInput input) async {
    return delete<BookedScheduleMessage>(
      path: '/schedule-detail',
      parseJsonFunction: BookedScheduleMessage.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<NextBookedScheduleOutput>> getNext() async {
    return get<NextBookedScheduleOutput>(
      path: '/next',
      parseJsonFunction: NextBookedScheduleOutput.fromJson,
    );
  }
}
