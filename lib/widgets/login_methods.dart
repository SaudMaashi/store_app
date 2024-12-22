import 'package:flutter/material.dart';
import 'package:store_app/widgets/login_method.dart';

class LoginMethods extends StatelessWidget {
  const LoginMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginMethodContainer(
          onTap: () {
            // To Be Implemented
          },
          icon: const Icon(Icons.apple, color: Colors.black),
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
