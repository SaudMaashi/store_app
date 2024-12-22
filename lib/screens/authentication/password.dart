import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_button.dart';
import 'package:store_app/widgets/app_text_form_field.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenSize.width * 0.2,
        toolbarHeight: screenSize.width * 0.18,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 24),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(24)),
              child: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
                  color: const Color(0xFF272727)),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 130),
        child: Column(
          children: [
            Row(
              children: [
                Text("Sign in",
                    style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: AppTextFormField(
                  onChanged: (value) {
                    // To Be Implemented
                  },
                  text: "Password"),
            ),
            AppButton(
                text: "Continue",
                onTap: () {
                  // To Be Implemented
                  // if password is valid & correct:
                  Navigator.pushReplacementNamed(context, "/user_main");
                },
                screenSize: screenSize),
            const SizedBox(height: 20),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      "Forgot password? ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        // To Be Implemented
                        Navigator.pushNamed(context, "/forgot_password");
                      },
                      child: Text(
                        "Reset",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
