import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final Function(String) onChanged;

  const AppSearchBar({
    super.key,
    required this.onChanged,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: Color(0xFF8E6CEF), width: 2),
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
