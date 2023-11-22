import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';
import 'package:lettutor/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

abstract class BaseScreen<Cubit extends WidgetCubit<State>,
    State extends WidgetState> extends BaseWidget<Cubit, State> {
  const BaseScreen({super.key});

  @override
  Widget buildUi(BuildContext context) {
    return BlocBuilder<Cubit, State>(
      builder: (context, state) {
        return GestureDetector(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: buildWidget(context),
              ),
              StreamBuilder(
                  stream: context.read<Cubit>().loadingStream,
                  builder: (context, snapshot) {
                    // This is the key part of the code that will display the loading widget
                    if (snapshot.hasData) {
                      if (snapshot.data?.isLoading ?? false) {
                        return Positioned.fill(
                            child: Center(
                          child: buildLoadingWidget(
                              context, snapshot.data?.message),
                        ));
                      }
                    }
                    return Container();
                  })
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildLoadingWidget(BuildContext context, String? message) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xffc6cbd2),
          width: 0.50,
        ),
        color: Colors.grey.shade200.withOpacity(0.8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.7,
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    decoration: TextDecoration.none, // Remove underline
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: Text(
                      message ?? 'Đang tải dữ liệu',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'San Francisco Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Assets.lottie.loading.lottie(
              width: 32,
              height: 32,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    const ['**'],
                    value: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
