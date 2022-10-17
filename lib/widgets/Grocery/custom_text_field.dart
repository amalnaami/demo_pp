import 'package:demo_app/Factories/colors_factory.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String? label;
  final TextEditingController controller;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final Widget? prefix;

  const CustomTextField({
    required this.hint,
    required this.controller,
    this.label,
    this.borderRadius = 8.0,
    this.borderColor = ColorsFactory.textFieldBorderColor,
    this.backgroundColor = ColorsFactory.textFieldFilledColor,
    this.prefix,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _internalMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    if (widget.label == null) return _buildField();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: _internalMargin),
        _buildField(),
      ],
    );
  }

  Widget _buildField() {
    return TextFormField(
      controller: widget.controller,
      decoration: _buildDecoration(context),
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
      hintText: widget.hint,
      filled: true,
      fillColor: widget.backgroundColor,
      enabledBorder: _buildBorder(widget.borderColor),
      focusedBorder: _buildBorder(widget.borderColor),
      prefixIcon: widget.prefix ?? const SizedBox(),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
  }
}
