import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/ui/section/section.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/presentation/detail_course_screen/view/detail_course_screen.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/course_cubit.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/courses_state.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
class DetailTopicScreen extends StatelessWidget {
  const DetailTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
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
              )
          ),
          endDrawer: const BaseDrawer(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: state.detailCourse?.imageUrl != null
                                ? CachedNetworkImage(
                              imageUrl: state.detailCourse?.imageUrl ?? '',
                              fit: BoxFit.contain,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            )
                                : const SizedBox.shrink()),
                        const SizedBox(height: 4),
                        Text(state.detailCourse?.name ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 8),
                        Text(
                          state.detailCourse?.description ?? '',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: HexColor.fromHex('#777777')),
                        ),
                        Section(
                          title: state.currentTopic?.name ?? '',
                          content: SizedBox(width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height, child: SfPdfViewer.network(state.currentTopic?.nameFile ?? ''))
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
