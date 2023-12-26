import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:choice/choice.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/common/config/navigation_event.dart';
import 'package:lettutor/common/config/router.dart';
import 'package:lettutor/common/ui/base_dialog/dialog_mixin.dart';
import 'package:lettutor/common/ui/base_snack_bar/snack_bar_mixin.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/common/ui/input_field/base_input_field.dart';
import 'package:lettutor/common/values/fixed_enum.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/core/base_widget/base_widget.dart';
import 'package:lettutor/core/data_source/network/models/input/update_profile_form.dart';
import 'package:lettutor/presentation/login_screen/components/input_form_field.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';
import 'package:unicons/unicons.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SnackBarMixin, DialogMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
            appBar: const BaseAppBar(),
            endDrawer: const BaseDrawer(),
            body: Container(
              height: MediaQuery.sizeOf(context).height,
              child: ListView(
                padding: const EdgeInsets.all(24),
                shrinkWrap: true,
                children: [
                  ...basicInformationBlock(context),
                  const SizedBox(height: 16),
                  const DetailedInfoBlock()
                ],
              ),
            ));
      },
    );
  }

  List<Widget> basicInformationBlock(BuildContext context) {
    return [
      BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Center(
            child: GestureDetector(
              onTap: () async {
                //pick image
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image != null) {
                  context.read<SplashCubit>().updateAvatar(image.path);
                } else {}
              },
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: state.user?.avatar ?? '',
                    fit: BoxFit.fill,
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
          );
        },
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
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 8),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
            onTap: () {},
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            onTap: () {
              showBasicDialog(
                  context: context,
                  showBottomButton: false,
                  onDismiss: () {
                    context.read<SplashCubit>().updatePasswordFormMessage('');
                  },
                  child: BlocProvider.value(
                    value: context.read<SplashCubit>(),
                    child: UpdatePasswordForm(
                      onSubmit: (oldPassword, newPassword) {
                        context
                            .read<SplashCubit>()
                            .updatePassword(oldPassword, newPassword);
                      },
                    ),
                  ));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      ])
    ];
  }
}

class DetailedInfoBlock extends StatefulWidget {
  const DetailedInfoBlock({super.key});

  @override
  State<DetailedInfoBlock> createState() => _DetailedInfoBlockState();
}

class _DetailedInfoBlockState extends State<DetailedInfoBlock> with SnackBarMixin {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _scheduleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = context.read<SplashCubit>().state.user?.name ?? '';
    _emailController.text = context.read<SplashCubit>().state.user?.email ?? '';
    _countryController.text =
        context.read<SplashCubit>().state.user?.country ?? '';
    _phoneController.text = context.read<SplashCubit>().state.user?.phone ?? '';
    _birthdayController.text =
        context.read<SplashCubit>().state.user?.birthday ?? '';
    _scheduleController.text =
        context.read<SplashCubit>().state.user?.studySchedule ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Text(
            'Country',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HexColor.fromHex('#000000'),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              alignment: Alignment.centerLeft,
              child: CountryCodePicker(
                hideSearch: true,
                initialSelection: _countryController.text,
                showDropDownButton: true,
                showOnlyCountryWhenClosed: true,
                onChanged: (value) {
                  _countryController.text = value.code ?? '';
                },
              )),
          const SizedBox(height: 16),
          InputFormField(
            controller: _phoneController,
            title: 'Phone',
            isReadOnly: true,
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
          Text(
            'Level',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HexColor.fromHex('#000000'),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: Level.values.firstWhere(
                    (element) => element.value == state.user?.level),
                items: Level.values
                    .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e.tagName)))
                    .toList(),
                onChanged: (value) {
                  context
                      .read<SplashCubit>()
                      .updateLevel(value ?? Level.beginner);
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Subject',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HexColor.fromHex('#000000'),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Choice<Subject>.inline(
            multiple: true,
            clearable: true,
            itemCount: Subject.values.length,
            itemBuilder: (choiceState, i) {
              return ChoiceChip(
                selected: state.user?.learnTopics?.map((e) => e.id).toList().contains(Subject.values[i].key) ?? false,
                onSelected: (bool? value) {
                  context.read<SplashCubit>().updateLearnTopics(Subject.values[i]);
                  choiceState.onSelected(Subject.values[i]);
                },
                label: Text(Subject.values[i].tagName),
              );
            },
            listBuilder: ChoiceList.createScrollable(
              padding: const EdgeInsets.all(8),
              spacing: 10,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Test Preparations',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HexColor.fromHex('#000000'),
            ),
          ),
          const SizedBox(height: 8),
          Choice<Test>.inline(
            multiple: true,
            clearable: true,
            itemCount: Test.values.length,
            itemBuilder: (choiceState, i) {
              return ChoiceChip(
                selected: state.user?.testPreparations?.map((e) => e.id).toList().contains(Test.values[i].key) ?? false,
                onSelected: (bool? value) {
                  context.read<SplashCubit>().updateTestPreparations(Test.values[i]);
                  choiceState.onSelected(Test.values[i]);
                },
                label: Text(Test.values[i].tagName),
              );
            },
            listBuilder: ChoiceList.createScrollable(
              padding: const EdgeInsets.all(8),
              spacing: 10,
            ),
          ),
          const SizedBox(height: 16),
          InputFormField(
            controller: _scheduleController,
            title: 'Schedule',
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.appBlue100,
                ),
                child: GestureDetector(
                  onTap: _handleSubmit,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      );
    });
  }

  void _handleSubmit() async {
    final inputForm = const UpdateProfileForm().copyWith(
      name: _nameController.text,
      country: _countryController.text,
      phone: _phoneController.text,
      birthday: _birthdayController.text,
      level: context.read<SplashCubit>().state.user?.level,
      studySchedule: _scheduleController.text,
      learnTopics: context.read<SplashCubit>().state.user?.learnTopics?.map((e) => e.id.toString()).toList(),
      testPreparations: context.read<SplashCubit>().state.user?.testPreparations?.map((e) => e.id.toString()).toList(),
    );
    await context.read<SplashCubit>().updateProfile(inputForm);
    context.read<SplashCubit>().state.isProfileUpdateSuccess ?? false
        ? showSnackBar(context, 'Update profile successfully', snackBarType: SnackBarType.success)
        : showSnackBar(context, context.read<SplashCubit>().state.updateProfileFormMessage ?? '');
  }
}

class UpdatePasswordForm extends StatefulWidget {
  final Function(String oldPassword, String newPassword) onSubmit;

  const UpdatePasswordForm({required this.onSubmit, super.key});

  @override
  State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
}

class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isValid = true;
  bool _isPasswordMatch = false;

  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFormField(
                      controller: _oldPasswordController,
                      title: 'Old Password',
                      isPassword: !_showOldPassword,
                      trailingIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showOldPassword = !_showOldPassword;
                            });
                          },
                          child: _showOldPassword
                              ? const Icon(UniconsLine.eye)
                              : const Icon(UniconsLine.eye_slash)),
                    ),
                    const SizedBox(height: 16),
                    InputFormField(
                      controller: _newPasswordController,
                      title: 'New Password',
                      isPassword: !_showNewPassword,
                      trailingIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showNewPassword = !_showNewPassword;
                            });
                          },
                          child: _showNewPassword
                              ? const Icon(UniconsLine.eye)
                              : const Icon(UniconsLine.eye_slash)),
                    ),
                    const SizedBox(height: 16),
                    InputFormField(
                      controller: _confirmPasswordController,
                      title: 'Confirm Password',
                      isPassword: !_showConfirmPassword,
                      trailingIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                          child: _showConfirmPassword
                              ? const Icon(UniconsLine.eye)
                              : const Icon(UniconsLine.eye_slash)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: _handleSubmit,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.appBlue100,
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 2),
            !_isValid || !_isPasswordMatch
                ? Text(
                    context.read<SplashCubit>().state.passwordFormMessage ?? '',
                    style: const TextStyle(
                      color: Color(0xFFFF5722),
                      fontSize: 14,
                      fontFamily: 'San Francisco Display',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.05,
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }

  void _handleSubmit() {
    if (_oldPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() {
        _isValid = false;
        context.read<SplashCubit>().updatePasswordFormMessage(
            'Please fill in all fields before submitting');
      });
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() {
        _isPasswordMatch = false;
        context.read<SplashCubit>().updatePasswordFormMessage(
            'New password and confirm password do not match');
      });
      return;
    }

    widget.onSubmit(_oldPasswordController.text, _newPasswordController.text);
  }
}
