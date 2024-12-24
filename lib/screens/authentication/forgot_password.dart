import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_button.dart';
import 'package:store_app/widgets/app_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenSize.width * 0.2,
        toolbarHeight: screenSize.width * 0.18,
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Forgot Password",
                      style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              AppTextFormField(
                text: "Enter Email Address",
                onChanged: (value) {
                  // To Be Implemented
                },
              ),
              SizedBox(height: screenSize.height * 0.02),
              AppButton(
                  screenSize: screenSize,
                  onTap: () {
                    // To Be Implemented
                    // If the email is registered in the system, it will go to this screen
                    Navigator.pushReplacementNamed(context, "/reset");
                  },
                  text: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
