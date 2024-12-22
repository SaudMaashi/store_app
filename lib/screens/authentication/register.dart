import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_button.dart';
import 'package:store_app/widgets/app_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenSize.width * 0.2,
        toolbarHeight: screenSize.width * 0.18,
        leading: InkWell(
          onTap: () {
            // To Be Implemented
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
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Create Account",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03),
              AppTextFormField(
                text: "First Name",
                onChanged: (value) {
                  // To Be Implemented
                },
              ),
              SizedBox(height: screenSize.height * 0.03),
              AppTextFormField(
                text: "First Name",
                onChanged: (value) {
                  // To Be Implemented
                },
              ),
              SizedBox(height: screenSize.height * 0.02),
              AppTextFormField(
                text: "First Name",
                onChanged: (value) {
                  // To Be Implemented
                },
              ),
              SizedBox(height: screenSize.height * 0.02),
              AppTextFormField(
                text: "First Name",
                onChanged: (value) {
                  // To Be Implemented
                },
              ),
              SizedBox(height: screenSize.height * 0.03),
              AppButton(
                  screenSize: screenSize,
                  onTap: () {
                    // To Be Implemented
                    Navigator.pushNamed(context, "/information");
                  },
                  text: "Continue"),
              SizedBox(height: screenSize.height * 0.03),
              Row(
                children: [
                  Text(
                    "Forgot password? ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      // To Be Implemented
                      Navigator.pushNamed(context, "/forgot_password");
                    },
                    child: Text(
                      "Reset",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
