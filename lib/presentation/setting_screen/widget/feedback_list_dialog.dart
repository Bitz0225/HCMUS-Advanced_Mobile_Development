import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';
import 'package:lettutor/presentation/teacher_detail_screen/view/teacher_detail_screen.dart';
import 'package:number_paginator/number_paginator.dart';

class FeedbackListDialog extends StatelessWidget {
  const FeedbackListDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
      return state.listFeedbacks?.isEmpty ?? true
          ? const Text('No feedbacks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))
          : SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: context
                                .read<SplashCubit>()
                                .state
                                .listFeedbacks
                                ?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return ReviewItem(
                              context,
                              context
                                  .read<SplashCubit>()
                                  .state
                                  .listFeedbacks?[index]);
                        }),
                  ),
                  const SizedBox(height: 16),
                  NumberPaginator(
                    numberPages: state.totalFeedbackPages ?? 1,
                    config: const NumberPaginatorUIConfig(
                        mode: ContentDisplayMode.hidden),
                    onPageChange: (int index) {
                      context.read<SplashCubit>().getOwnFeedBack(index + 1);
                    },
                  )
                ],
              ),
            );
    });
  }
}
