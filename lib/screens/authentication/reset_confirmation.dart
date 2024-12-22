import 'package:flutter/material.dart';

class ResetConfirmationScreen extends StatelessWidget {
  const ResetConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/sent.png"),
            const SizedBox(height: 50),
            Text(
              "We sent you an Email to reset\nyour password.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screenSize.width * 0.4, 60),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: const Text("Return to login"),
            ),
          ],
        ),
      ),
    );
  }
}
