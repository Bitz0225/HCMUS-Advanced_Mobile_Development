import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
            appBar: const BaseAppBar(),
            endDrawer: const BaseDrawer(),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    basicInformationBlock(context),
                    const SizedBox(height: 16),
                    const DetailedInfoBlock()
                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget basicInformationBlock(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 48,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        context.read<SplashCubit>().state.user?.avatar ?? '',
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.read<SplashCubit>().state.user?.name ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Account ID: ${context.read<SplashCubit>().state.user?.id ?? ''}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.appBlue100),
                      ),
                      child: Text(
                        'Reviews received',
                        style: TextStyle(
                          color: AppColors.appBlue100,
                        ),
                      ))),
              const Spacer(),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.appBlue100),
                      ),
                      child: Text(
                        'Change password',
                        style: TextStyle(
                          color: AppColors.appBlue100,
                        ),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}

class DetailedInfoBlock extends StatefulWidget {
  const DetailedInfoBlock({super.key});

  @override
  State<DetailedInfoBlock> createState() => _DetailedInfoBlockState();
}

class _DetailedInfoBlockState extends State<DetailedInfoBlock> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _scheduleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = context.read<SplashCubit>().state.user?.name ?? '';
    _emailController.text = context.read<SplashCubit>().state.user?.email ?? '';
    _countryController.text =
        context.read<SplashCubit>().state.user?.country ?? '';
    _birthdayController.text =
        context.read<SplashCubit>().state.user?.birthday ?? '';
    _scheduleController.text =
        context.read<SplashCubit>().state.user?.studySchedule ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputFormField(
              controller: _nameController,
              title: 'Name',
            ),
            const SizedBox(height: 16),
            InputFormField(
              title: 'Email Address',
              controller: _emailController,
              isReadOnly: true,
            ),
            const SizedBox(height: 16),
            InputFormField(
              controller: _countryController,
              title: 'Country',
            ),
            const SizedBox(height: 16),
            InputFormField(
                keyboardType: TextInputType.none,
                controller: _birthdayController,
                title: 'Birthday',
                onTap: () async {
                  final bDay = state.user?.birthday ?? '1970-01-01';
                  final dtbDay = DateTime.parse(bDay);
                  final date = await showDatePicker(
                    context: context,
                    initialDate: dtbDay,
                    firstDate: DateTime(DateTime.now().year - 100),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    _birthdayController.text =
                        DateFormat('yyyy-MM-dd').format(date);
                  }
                }),
            const SizedBox(height: 16),
            InputFormField(
              controller: _scheduleController,
              title: 'Schedule',
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    });
  }
}

class UpdatePasswordForm extends StatefulWidget {
  const UpdatePasswordForm({super.key});

  @override
  State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
}

class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
