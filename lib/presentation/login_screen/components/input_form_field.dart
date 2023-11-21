import 'package:flutter/material.dart';
import 'package:lettutor/common/ui/input_field/base_input_field.dart';
import 'package:lettutor/common/values/hex_color.dart';

class InputFormField extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool? isPassword;
  final Widget? trailingIcon;

  const InputFormField(
      {super.key, this.title, this.hint, this.isPassword, this.trailingIcon});

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
          keyboardType: TextInputType.text,
          hint: hint ?? '',
          isPassword: isPassword ?? false,
          suffixIcon: trailingIcon ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
