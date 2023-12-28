import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/ui/section/section.dart';
import 'package:lettutor/common/ui/tag_item/tag_item.dart';
import 'package:lettutor/common/values/fixed_enum.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/core/data_source/network/models/output/feedback_model.dart';
import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_state.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:unicons/unicons.dart';

@RoutePage()
class BaseTeacherDetailWrapper extends BaseWidget<TutorCubit, TutorState> {
  const BaseTeacherDetailWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return const TeacherDetailScreen();
  }

  @override
  TutorCubit? provideCubit(BuildContext context) {
    return null;
  }
}

class TeacherDetailScreen extends StatelessWidget {
  const TeacherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorCubit, TutorState>(
      builder: (context, state) {
        final tutorInfo = state.currentDetailTutor;
        return Scaffold(
          appBar: BaseAppBar(
              leading: GestureDetector(
            onTap: () {
              context.router.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )),
          endDrawer: const BaseDrawer(),
          // extendBody: true,
          // extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TeacherInfo(
                    tutor: TutorSearchOutputItem(
                      avatar: tutorInfo?.user?.avatar,
                      bio: tutorInfo?.bio,
                      country: tutorInfo?.user?.country,
                      id: tutorInfo?.user?.id,
                      isFavoriteTutor: tutorInfo?.isFavorite,
                      isNative: tutorInfo?.isNative,
                      name: tutorInfo?.user?.name,
                      rating: tutorInfo?.rating,
                      specialities: tutorInfo?.specialties,
                    ),
                    showFavoriteButton: false,
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _IconWithDescription(
                        icon: UniconsLine.heart,
                        description: 'Favourite',
                      ),
                      _IconWithDescription(
                        icon: Icons.report_gmailerrorred_outlined,
                        description: 'Report',
                      ),
                      _IconWithDescription(
                        icon: Icons.star_border,
                        description: 'Reviews',
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Section(
                      title: 'Education',
                      content: Text(tutorInfo?.education ?? 'No information')),
                  const SizedBox(height: 16),
                  Section(
                    title: 'Languages',
                    content: Wrap(
                      runSpacing: 16,
                      spacing: 8,
                      children: tutorInfo?.languages
                              ?.split(',')
                              .map((e) => TagItem(content: e))
                              .toList() ??
                          [],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Section(
                      title: 'Specialities',
                      content: Wrap(
                        spacing: 8,
                        runSpacing: 16,
                        children: tutorInfo?.specialties
                                ?.split(',')
                                .map((e) => TagItem(
                                      content: Tags.values
                                          .firstWhere(
                                              (element) => element.value == e,
                                              orElse: () => Tags.empty)
                                          .tagName,
                                    ))
                                .toList() ??
                            [],
                      )),
                  const SizedBox(height: 16),
                  Section(
                      title: 'Interest',
                      content: Text(tutorInfo?.interests ?? 'No information')),
                  const SizedBox(height: 16),
                  Section(
                      title: 'Teaching experience',
                      content: Text(tutorInfo?.experience ?? 'No information')),
                  const SizedBox(height: 16),
                  Section(
                    title: 'Other reviews',
                    content: ReviewSection(context),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget ReviewSection(BuildContext context) {
    return BlocBuilder<TutorCubit, TutorState>(
      builder: (context, state) {
        return Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context
                        .read<TutorCubit>()
                        .state
                        .feedbackOutput
                        ?.data
                        ?.rows
                        ?.length ??
                    0,
                itemBuilder: (context, index) {
                  return ReviewItem(
                      context,
                      context
                          .read<TutorCubit>()
                          .state
                          .feedbackOutput
                          ?.data
                          ?.rows?[index]);
                }),

          ],
        );
      },
    );
  }

  Widget ReviewItem(BuildContext context, FeedbackRows? data) {
    return Row(
      children: [
        SizedBox(
          width: 72,
          height: 72,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
                imageUrl: data?.firstInfo?.avatar ??
                    'https://res.cloudinary.com/demo/image/upload/d_avatar.png/non_existing_id.png',
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                errorWidget: (context, url, error) => CachedNetworkImage(
                    imageUrl:
                        'https://res.cloudinary.com/demo/image/upload/d_avatar.png/non_existing_id.png',
                    fit: BoxFit.fill)),
          ),
        ),
        Column(
          children: [
            Text(
              data?.firstInfo?.name ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Icon(
                  Icons.star,
                  color: index + 1 > (data?.rating ?? 0)
                      ? Colors.grey
                      : Colors.yellow,
                  size: 16,
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              data?.content ?? '',
            )
          ],
        ),
      ],
    );
  }
}

class TeacherInfo extends StatefulWidget {
  final TutorSearchOutputItem? tutor;
  final bool? showFavoriteButton;

  const TeacherInfo({super.key, this.tutor, this.showFavoriteButton});

  @override
  State<TeacherInfo> createState() => _TeacherInfoState();
}

class _TeacherInfoState extends State<TeacherInfo> {
  bool isFavoriteTutor = false;

  @override
  void initState() {
    super.initState();
    isFavoriteTutor = widget.tutor?.isFavoriteTutor ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TutorCubit, TutorState>(
      listener: (context, state) {
        setState(() {
          isFavoriteTutor = widget.tutor?.isFavoriteTutor ?? false;
        });
      },
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 72,
                    height: 72,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                          imageUrl: widget.tutor?.avatar ??
                              'https://res.cloudinary.com/demo/image/upload/d_avatar.png/non_existing_id.png',
                          fit: BoxFit.fill,
                          placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          errorWidget: (context, url, error) => CachedNetworkImage(
                              imageUrl:
                                  'https://res.cloudinary.com/demo/image/upload/d_avatar.png/non_existing_id.png',
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                widget.showFavoriteButton ?? false
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () => {
                            setState(() {
                              isFavoriteTutor = !isFavoriteTutor;
                            }),
                            EasyDebounce.debounce(
                                'debounceFavoriteTutor',
                                const Duration(milliseconds: 1000),
                                () => handleFavoriteTutor(context,
                                    isFavoriteTutor, widget.tutor?.id ?? ''))
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isFavoriteTutor ? Colors.red : Colors.grey,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Text(
              widget.tutor?.name ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.tutor?.rating == null
                    ? const SizedBox.shrink()
                    : const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                const SizedBox(width: 4),
                Text(
                  widget.tutor?.rating == null
                      ? 'No rating yet'
                      : widget.tutor?.rating?.toStringAsFixed(2) ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.tutor?.country ?? '',
            ),
            const SizedBox(height: 8),
            Text(
              widget.tutor?.bio ?? '',
            ),
          ],
        );
      },
    );
  }

  Future<void> handleFavoriteTutor(
      BuildContext context, bool currentState, String tutorId) async {
    final tutor = context
        .read<TutorCubit>()
        .state
        .tutorList
        ?.firstWhere((element) => element.id == tutorId);
    if (tutor == null) {
      return;
    }
    if (tutor.isFavoriteTutor == currentState) {
      return;
    }
    context.read<TutorCubit>().updateFavoriteState(widget.tutor?.id ?? '');
  }
}

class _IconWithDescription extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final String? description;

  const _IconWithDescription(
      {super.key, this.icon, this.description, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color ?? AppColors.appBlue100,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          description ?? '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.appBlue100,
          ),
        ),
      ],
    );
  }
}
