import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leadingWidth: screenSize.width * 0.2,
          toolbarHeight: screenSize.width * 0.18,
          leading: const AppBackButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Shop by Categories",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            CategoryCard(
              image: "assets/images/hoodies.png",
              onTap: () {
                // To Be Implemented
              },
              text: "Hoodies",
            ),
            CategoryCard(
              image: "assets/images/accessories.png",
              onTap: () {
                // To Be Implemented
              },
              text: "Accessories",
            ),
            CategoryCard(
              image: "assets/images/shorts.png",
              onTap: () {
                // To Be Implemented
              },
              text: "Shorts",
            ),
            CategoryCard(
              image: "assets/images/shoes.png",
              onTap: () {
                // To Be Implemented
              },
              text: "Shoes",
            ),
            CategoryCard(
              image: "assets/images/bags.png",
              onTap: () {
                // To Be Implemented
              },
              text: "Bags",
            ),
          ],
        ),
      ),
    );
  }
}
