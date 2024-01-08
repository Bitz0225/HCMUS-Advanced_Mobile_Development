import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:country/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_dialog/dialog_mixin.dart';
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
import 'package:lettutor/presentation/teacher_detail_screen/widget/report_form.dart';
import 'package:lettutor/presentation/teacher_detail_screen/widget/teacher_info.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:sealed_countries/sealed_countries.dart';
import 'package:unicons/unicons.dart';
import 'package:video_player/video_player.dart';

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

class TeacherDetailScreen extends StatefulWidget {
  const TeacherDetailScreen({super.key});

  @override
  State<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen>
    with DialogMixin {
  bool isFavoriteTutor = false;
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    isFavoriteTutor =
        context.read<TutorCubit>().state.currentDetailTutor?.isFavorite ??
            false;
    _videoController = VideoPlayerController.networkUrl(Uri.parse(
        context.read<TutorCubit>().state.currentDetailTutor?.video ?? ''))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoInitialize: true,
      allowFullScreen: false,
      placeholder: Container(
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorCubit, TutorState>(
      builder: (context, state) {
        final tutorInfo = state.currentDetailTutor;
        return Scaffold(
          appBar: BaseAppBar(
              leading: GestureDetector(
            onTap: () {
              context.router.replace(const ListTeachersScreenRoute());
            },
            child: Icon(
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
                  Center(
                    child: _videoController.value.isInitialized
                        ? Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 16.0/9.0,
                                child: Chewie(
                                  controller: _chewieController,
                                )
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => {
                          setState(() {
                            isFavoriteTutor = !isFavoriteTutor;
                          }),
                          EasyDebounce.debounce(
                              'debounceFavoriteTutor',
                              const Duration(milliseconds: 1000),
                              () => handleFavoriteTutor(
                                  context: context,
                                  currentState: isFavoriteTutor,
                                  tutorId: tutorInfo?.user?.id ?? ''))
                        },
                        child: _IconWithDescription(
                          icon: Icons.favorite,
                          color: isFavoriteTutor ? Colors.red : Colors.grey,
                          description: Text(
                            isFavoriteTutor ? 'Favorited' : 'Favorite',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isFavoriteTutor
                                  ? Colors.red
                                  : AppColors.appBlue100,
                            ),
                          ),
                          onTap: () => {
                            setState(() {
                              isFavoriteTutor = !isFavoriteTutor;
                            }),
                            EasyDebounce.debounce(
                                'debounceFavoriteTutor',
                                const Duration(milliseconds: 1000),
                                () => handleFavoriteTutor(
                                    context: context,
                                    currentState: isFavoriteTutor,
                                    tutorId: tutorInfo?.user?.id ?? ''))
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showBasicDialog(
                              context: context,
                              barrierDismissible: false,
                              title: 'Report ' + (tutorInfo?.user?.name ?? ''),
                              showBottomButton: false,
                              // onDismiss: () {},
                              child: BlocProvider.value(
                                value: context.read<TutorCubit>(),
                                child: ReportForm(
                                  onSubmit: (value) {
                                    handleSubmitReport(
                                        context: context,
                                        content: value,
                                        tutorId: tutorInfo?.user?.id ?? '');
                                  },
                                ),
                              ));
                        },
                        child: _IconWithDescription(
                          icon: Icons.report_gmailerrorred_outlined,
                          description: Text(
                            'Report',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.appBlue100,
                            ),
                          ),
                          onTap: () {
                            showBasicDialog(
                                context: context,
                                barrierDismissible: false,
                                title:
                                    'Report ' + (tutorInfo?.user?.name ?? ''),
                                showBottomButton: false,
                                // onDismiss: () {},
                                child: BlocProvider.value(
                                  value: context.read<TutorCubit>(),
                                  child: ReportForm(
                                    onSubmit: (value) {
                                      handleSubmitReport(
                                          context: context,
                                          content: value,
                                          tutorId: tutorInfo?.user?.id ?? '');
                                    },
                                  ),
                                ));
                          },
                        ),
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
                  (tutorInfo?.user?.courses?.length ?? 0) > 0
                      ? Section(
                          title: 'Suggested courses',
                          content: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tutorInfo?.user?.courses?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    tutorInfo?.user?.courses?[index].name ??
                                        '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }))
                      : const SizedBox.shrink(),
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
        return state.feedbackOutput?.data?.count == 0
            ? const Text('No feedbacks',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ))
            : Column(
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
                  const SizedBox(height: 16),
                  NumberPaginator(
                    numberPages: state.totalFeedbackPages ?? 1,
                    onPageChange: (int index) {
                      context
                          .read<TutorCubit>()
                          .updateFeedbackPage(index + 1)
                          .then((value) => context
                              .read<TutorCubit>()
                              .getFeedback(
                                  context
                                          .read<TutorCubit>()
                                          .state
                                          .currentDetailTutor
                                          ?.user
                                          ?.id ??
                                      '',
                                  index + 1));
                    },
                  )
                ],
              );
      },
    );
  }

  Widget ReviewItem(BuildContext context, FeedbackRows? data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            height: 36,
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
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data?.firstInfo?.name ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              AnimatedRatingStars(
                initialRating: data?.rating?.toDouble() ?? 0,
                customEmptyIcon: Icons.star_border,
                onChanged: (value) {},
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half,
                readOnly: true,
                starSize: 8,
              ),
              const SizedBox(height: 8),
              Text(
                data?.content ?? '',
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> handleFavoriteTutor({
    required BuildContext context,
    required bool currentState,
    required String tutorId,
  }) async {
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
    await context.read<TutorCubit>().updateFavoriteState(tutorId);
  }

  Future<void> handleSubmitReport(
      {required BuildContext context,
      required String content,
      required String tutorId}) async {
    await context
        .read<TutorCubit>()
        .reportTutor(content: content, tutorId: tutorId);
  }
}

class _IconWithDescription extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final Widget? description;
  final Function? onTap;

  const _IconWithDescription(
      {super.key, this.icon, this.description, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onTap?.call(),
          child: Icon(
            icon,
            color: color ?? AppColors.appBlue100,
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        description ?? const SizedBox.shrink(),
      ],
    );
  }
}
