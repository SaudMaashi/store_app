import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_button.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF8E6CEF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: screenSize.height * 0.2),
            Image.asset("assets/images/order_placed.png"),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              height: screenSize.height * 0.45,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Text("Order Placed",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                      Text("Successfully",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                      SizedBox(height: 24),
                      Text(
                        "You will receive an email confirmation",
                        style: TextStyle(
                            color: Color(0xFF8E8E8E),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  AppButton(
                      screenSize: screenSize,
                      onTap: () {
                        // To be implemeneted
                      },
                      text: "See Order Details")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
