import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_back_button.dart';
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
          leading: const AppBackButton()),
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
