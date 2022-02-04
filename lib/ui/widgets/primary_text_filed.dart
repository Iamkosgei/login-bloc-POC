import 'package:flutter/material.dart';
import 'package:nnke/utils/colors.dart';

class PrimaryTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final Function(String?)? onSaved, onChanged;
  final String? Function(String?) validator;
  final Widget? prefix, suffix;
  final Color color;

  const PrimaryTextField({
    Key? key,
    required this.label,
    this.obscureText = false,
    required this.validator,
    required this.onSaved,
    this.prefix,
    this.suffix,
    this.color = primaryColor,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        onSaved: onSaved,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          prefix: prefix,
          suffix: suffix,
        ),
      ),
    );
  }
}
