import 'package:flutter/material.dart';

class LoginMethodContainer extends StatelessWidget {
  const LoginMethodContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final Icon icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListTile(
          leading: icon,
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
