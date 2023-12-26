import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/ui/section/section.dart';
import 'package:lettutor/common/ui/tag_item/tag_item.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_cubit.dart';
import 'package:unicons/unicons.dart';

@RoutePage()
class TeacherDetailScreen extends StatelessWidget {
  const TeacherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TeacherInfo(
                name: 'Keegan',
                ratings: 4,
                ratingsCount: 58,
                nationality: 'France',
                description:
                    'I am a French teacher with 5 years of experience.',
              ),
              SizedBox(height: 16),
              Row(
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
              SizedBox(height: 48),
              Section(title: 'Education', content: Text('BA')),
              SizedBox(height: 16),
              Section(
                title: 'Languages',
                content: Wrap(
                  runSpacing: 16,
                  spacing: 8,
                  children: [
                    TagItem(
                      content: 'English',
                    ),
                    TagItem(
                      content: 'French',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Section(
                  title: 'Specialities',
                  content: Wrap(
                    spacing: 8,
                    runSpacing: 16,
                    children: [
                      TagItem(
                        content: 'English for Business',
                      ),
                      TagItem(
                        content: 'Conversational',
                      ),
                      TagItem(
                        content: 'English for kids',
                      ),
                      TagItem(
                        content: 'IELTS',
                      ),
                      TagItem(
                        content: 'STARTERS',
                      ),
                      TagItem(
                        content: 'MOVERS',
                      ),
                      TagItem(
                        content: 'FLYERS',
                      ),
                      TagItem(
                        content: 'KET',
                      ),
                      TagItem(
                        content: 'PET',
                      ),
                      TagItem(
                        content: 'TOEFL',
                      ),
                      TagItem(
                        content: 'TOEIC',
                      ),
                    ],
                  )),
              SizedBox(height: 16),
              Section(
                  title: 'Interest',
                  content: Text(
                      'I loved the weather, the scenery and the laid-back lifestyle of the locals.')),
              SizedBox(height: 16),
              Section(
                  title: 'Teaching experience',
                  content: Text(
                      'I have more than 10 years of teaching English experience'))
            ],
          ),
        ),
      ),
    );
  }
}

class TeacherInfo extends StatelessWidget {
  final String? name;
  final String? avatarUrl;
  final double? ratings;
  final int? ratingsCount;
  final String? nationality;
  final String? userId;
  final bool? isFavoriteTutor;
  final String? description;
  final bool? showFavoriteButton;

  const TeacherInfo(
      {super.key,
      this.name,
      this.ratings,
      this.userId,
      this.ratingsCount,
      this.nationality,
      this.description,
      this.avatarUrl,
      this.showFavoriteButton,
      this.isFavoriteTutor});

  @override
  Widget build(BuildContext context) {
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
                      imageUrl: avatarUrl ??
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
            showFavoriteButton ?? false
                ? Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color:
                            isFavoriteTutor ?? false ? Colors.red : Colors.grey,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        Text(
          name ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              ratings != null ? ratings.toString() : 'No reviews yet',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          nationality ?? '',
        ),
        const SizedBox(height: 8),
        Text(
          description ?? '',
        ),
      ],
    );
  }
}

class _IconWithDescription extends StatelessWidget {
  final IconData? icon;
  final String? description;

  const _IconWithDescription({super.key, this.icon, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.appBlue100,
          size: 16,
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
