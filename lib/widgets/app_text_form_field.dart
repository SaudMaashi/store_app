import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.text,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  final String text;
  final Function(String) onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(text),
      ),
    );
  }
}
