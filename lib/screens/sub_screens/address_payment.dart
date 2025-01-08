import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_button.dart';

class AddressPaymentScreen extends StatelessWidget {
  const AddressPaymentScreen({super.key});

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
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  // To be implemeneted
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipping Address",
                                style: TextStyle(
                                    color: Color(0xFF8E8E8E), fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Add Shipping Address",
                                style: TextStyle(fontSize: 19),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  // To be implemeneted
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Method",
                                style: TextStyle(
                                    color: Color(0xFF8E8E8E), fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Add Payment Method",
                                style: TextStyle(fontSize: 19),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: const Color(0xFF939393)),
                      ),
                      Text(
                        "\$200",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Cost",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: const Color(0xFF939393)),
                      ),
                      Text(
                        "\$8.00",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: const Color(0xFF939393)),
                      ),
                      Text(
                        "\$0.00",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: const Color(0xFF939393)),
                      ),
                      Text(
                        "\$208",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                  fixedSize: const Size(double.infinity, 75)),
              onPressed: () {
                Navigator.pushNamed(context, "/order_placed");
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$208"),
                  Text("Place Order"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
