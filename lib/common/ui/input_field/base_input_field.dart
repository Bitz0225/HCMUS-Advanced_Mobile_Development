import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/common/values/hex_color.dart';

class BaseInputField extends StatefulWidget {
  const BaseInputField(
      {super.key,
      this.height = 30,
      this.keyboardType,
      this.onChanged,
      this.isValid = true,
      this.controller,
      this.hint,
      this.onFieldInit,
      this.inputFormatters,
      this.isPassword});

  final double height;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isValid;
  final Function()? onFieldInit;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isPassword;

  @override
  State<BaseInputField> createState() => _BaseInputFieldState();
}

class _BaseInputFieldState extends State<BaseInputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: widget.isValid
                  ? BorderSide(color: HexColor.fromHex('#999999'))
                  : BorderSide(color: Colors.red)
          ),
          border: OutlineInputBorder(
              borderSide: widget.isValid
                  ? BorderSide(color: HexColor.fromHex('#999999'))
                  : BorderSide(color: Colors.red)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)
          ),
          hintText: widget.hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8)
        ),
        keyboardType: widget.keyboardType,
        //make cursor in center vertically
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.isPassword ?? false,
        cursorColor: HexColor.fromHex('#333333'),
      ),
    );
  }
}
