import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_state.dart';
import 'package:lettutor/presentation/schedule_screen/widget/schedule_item.dart';

@RoutePage()
class ScheduleScreen extends BaseWidget<ScheduleCubit, ScheduleState> {
  const ScheduleScreen({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const BaseAppBar(),
          endDrawer: const BaseDrawer(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Assets.svg.calendar.svg(
                                width: MediaQuery
                                    .sizeOf(context)
                                    .width * 0.25)),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text('Schedule',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900)),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        'You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.bookedScheduleOutput?.data?.rows?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(height: 16),
                            ScheduleItem(
                              bookedSchedule: state.bookedScheduleOutput?.data?.rows?[index],
                            ),
                          ],
                        );
                      },
                    ),
                  ]
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  ScheduleCubit? provideCubit(BuildContext context) {
    return ScheduleCubit()
      ..init();
  }
}
