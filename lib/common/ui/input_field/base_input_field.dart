import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      this.inputFormatters});

  final double height;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isValid;
  final Function()? onFieldInit;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;

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
                  ? BorderSide(color: Colors.blue)
                  : BorderSide(color: Colors.red)
          ),
          border: OutlineInputBorder(
              borderSide: widget.isValid
                  ? const BorderSide(color: Colors.blue)
                  : BorderSide(color: Colors.red)
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
      ),
    );
  }
}
