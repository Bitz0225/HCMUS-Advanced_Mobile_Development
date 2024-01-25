import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_state.dart';

class TeacherInfo extends StatefulWidget {
  final TutorSearchOutputItem? tutor;
  final bool? showFavoriteButton;
  final bool? isShortDescription;
  final Function? handleRedirect;
  final int? index;

  const TeacherInfo(
      {super.key,
        this.tutor,
        this.showFavoriteButton,
        this.isShortDescription = false,
        this.index,
        this.handleRedirect});

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
      listenWhen: (previous, current) =>
      previous.tutorList != current.tutorList,
      listener: (context, state) {
        setState(() {
          isFavoriteTutor = context
              .read<TutorCubit>()
              .state
              .tutorList?[widget.index ?? 0]
              .isFavoriteTutor ??
              false;
        });
      },
      buildWhen: (previous, current) => previous.tutorList != current.tutorList,
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      widget.handleRedirect?.call(context);
                    },
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
                            errorWidget: (context, url, error) =>
                                CachedNetworkImage(
                                    imageUrl:
                                    'https://res.cloudinary.com/demo/image/upload/d_avatar.png/non_existing_id.png',
                                    fit: BoxFit.fill)),
                      ),
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
            widget.isShortDescription ?? false
                ? Text(
              widget.tutor?.bio ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
                : Text(
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