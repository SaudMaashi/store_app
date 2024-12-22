import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_button.dart';
import 'package:store_app/widgets/app_text_form_field.dart';
import 'package:store_app/widgets/login_methods.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    text: "Email Address"),
              ),
              AppButton(
                  text: "Continue",
                  onTap: () {
                    Navigator.pushNamed(context, "/password");
                  },
                  screenSize: screenSize),
              const SizedBox(height: 20),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          // To Be Implemented
                          Navigator.pushNamed(context, "/register");
                        },
                        child: Text(
                          "Create One",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.1),
              const LoginMethods(),
            ],
          ),
        ),
      ),
    );
  }
}
