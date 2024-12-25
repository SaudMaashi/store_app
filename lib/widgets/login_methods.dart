import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/widgets/login_method.dart';

class LoginMethods extends StatelessWidget {
  const LoginMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;

    return Column(
      children: [
        LoginMethodContainer(
          onTap: () {
            // To Be Implemented
          },
          icon: Icon(Icons.apple,
              color: isLightTheme ? Colors.black : Colors.white),
          text: "Continue With Apple",
        ),
        const SizedBox(height: 16),
        LoginMethodContainer(
            onTap: () {
              // To Be Implemented
            },
            icon:
                const Icon(Icons.g_mobiledata, color: Colors.orange, size: 32),
            text: "Continue With Google"),
        const SizedBox(height: 16),
        LoginMethodContainer(
            onTap: () {
              // To Be Implemented
            },
            icon: const Icon(Icons.facebook, color: Color(0xFF1A77F2)),
            text: "Continue With Facebook"),
      ],
    );
  }
}
