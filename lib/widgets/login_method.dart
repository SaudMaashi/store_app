import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              isLightTheme ? const Color(0xFFF4F4F4) : const Color(0xFF342F3F),
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
