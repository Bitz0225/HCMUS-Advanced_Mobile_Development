import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/common/values/hex_color.dart';

class BaseInputField extends StatefulWidget {
  const BaseInputField(
      {super.key,
      this.height = 30,
      this.keyboardType,
      this.onChanged,
      this.onSubmitted,
      this.controller,
      this.hint,
      this.onTap,
      this.inputFormatters,
      this.isPassword,
      this.isReadOnly,
      this.suffixIcon,
      this.prefixIcon,
      this.isValid,
      this.maxLines});

  final double height;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final Function()? onTap;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isValid;
  final bool? isPassword;
  final bool? isReadOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;

  @override
  State<BaseInputField> createState() => _BaseInputFieldState();
}

class _BaseInputFieldState extends State<BaseInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: HexColor.fromHex('#cccccc'),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
            isDense: true,
            errorBorder: (widget.isValid ?? true)
                ? const OutlineInputBorder(borderSide: BorderSide.none)
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: (widget.isReadOnly ?? false)
                ? const OutlineInputBorder(borderSide: BorderSide.none)
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
            hintText: widget.hint,
            // prefixIcon: widget.prefixIcon ?? const SizedBox.shrink(),
            suffixIcon: widget.suffixIcon ?? const SizedBox.shrink(),
            fillColor: (widget.isReadOnly ?? false)
                ? HexColor.fromHex('#eeeeee')
                : Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
        keyboardType: widget.keyboardType,
        //make cursor in center vertically
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        readOnly: widget.isReadOnly ?? false,
        enabled: !(widget.isReadOnly ?? false),
        inputFormatters: widget.inputFormatters,
        obscureText: widget.isPassword ?? false,
        cursorColor: HexColor.fromHex('#333333'),
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        onSubmitted: widget.onSubmitted,
        maxLines: widget.maxLines ?? 1,
      ),
    );
  }
}
