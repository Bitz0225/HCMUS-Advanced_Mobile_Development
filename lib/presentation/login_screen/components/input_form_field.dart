import 'package:flutter/material.dart';
import 'package:lettutor/common/ui/input_field/base_input_field.dart';
import 'package:lettutor/common/values/hex_color.dart';

class InputFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? title;
  final String? hint;
  final bool? isValid;
  final bool? isPassword;
  final Widget? trailingIcon;
  final bool? isReadOnly;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;

  const InputFormField(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.isValid = true,
      this.title,
      this.hint,
      this.isPassword,
      this.trailingIcon,
      this.isReadOnly,
      this.controller,
      this.onTap,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: HexColor.fromHex('#000000'),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 8,
        ),
        BaseInputField(
          controller: controller,
          keyboardType: keyboardType,
          hint: hint ?? '',
          isValid: isValid ?? true,
          isPassword: isPassword ?? false,
          isReadOnly: isReadOnly ?? false,
          onTap: onTap,
          suffixIcon: trailingIcon ?? const SizedBox.shrink(),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
