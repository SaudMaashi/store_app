import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.screenSize,
    required this.onTap,
    required this.text,
  });

  final Size screenSize;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(screenSize.width * 0.9, 60),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}
