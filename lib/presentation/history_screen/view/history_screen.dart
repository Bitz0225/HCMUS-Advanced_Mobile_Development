import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/history_screen/widget/history_item.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_cubit.dart';
import 'package:lettutor/presentation/schedule_screen/cubit/schedule_state.dart';
import 'package:number_paginator/number_paginator.dart';

@RoutePage()
class HistoryScreen extends BaseWidget<ScheduleCubit, ScheduleState> {
  const HistoryScreen({super.key});

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
                            child: Assets.svg.history.svg(
                                width: MediaQuery
                                    .sizeOf(context)
                                    .width * 0.25)),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text('History',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900)),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        'You can review the details of the lessons you have attended',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    (state.bookedHistoryOutput?.data?.rows?.isNotEmpty ?? false) ?
                    Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.bookedHistoryOutput?.data?.rows?.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const SizedBox(height: 16),
                                HistoryItem(
                                    bookedSchedule: state.bookedHistoryOutput?.data?.rows?[index]),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        NumberPaginator(
                          numberPages: state.totalHistoryPages ?? 1,
                          onPageChange: (int page) {
                            context.read<ScheduleCubit>().getHistory(page + 1);
                          },
                        )
                      ],
                    )
                        : const Text(
                      'Your booking history is empty.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
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
    // TODO: implement provideCubit
    return ScheduleCubit()
      ..getHistory(1);
  }

}
