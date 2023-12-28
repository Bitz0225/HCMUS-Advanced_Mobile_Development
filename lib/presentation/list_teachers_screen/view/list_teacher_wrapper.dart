import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_state.dart';

@RoutePage()
class ListTeachersWrapper extends BaseWidget<TutorCubit, TutorState> {
  const ListTeachersWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return BlocProvider(
        create: (context) => TutorCubit()..init(), child: const AutoRouter());
  }

  @override
  TutorCubit? provideCubit(BuildContext context) {
    return null;
  }
}