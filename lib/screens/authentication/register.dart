// ignore_for_file: unused_import, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_button.dart';
import 'package:store_app/widgets/app_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
                  _firstName = value;
                },
              ),
              SizedBox(height: screenSize.height * 0.03),
              AppTextFormField(
                text: "Last Name",
                onChanged: (value) {
                  _lastName = value;
                },
              ),
              SizedBox(height: screenSize.height * 0.02),
              AppTextFormField(
                keyboardType: TextInputType.emailAddress,
                text: "Email Address",
                onChanged: (value) {
                  _email = _firstName = value;
                },
              ),
              SizedBox(height: screenSize.height * 0.02),
              AppTextFormField(
                text: "Password",
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: screenSize.height * 0.03),
              AppButton(
                  screenSize: screenSize,
                  onTap: () {
                    // try {
                    //   firebaseAuth.createUserWithEmailAndPassword(
                    //       email: _email!, password: _password!);
                    // } on FirebaseAuthException catch (exception) {
                    //   if (exception.code == "email-already-in-use") {
                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(const SnackBar(content: Text("Sa")));
                    //   }
                    // }
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
