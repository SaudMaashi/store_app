import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/sub_screens/categories_general.dart';
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CategoriesGeneralScreen(
                        category: "Hoodies",
                        categoryItems: [
                          Product(
                              name: "Men's Harrington Jacket",
                              image: "assets/images/product1.png",
                              price: "148",
                              hasDiscount: false,
                              category: "Men"),
                          Product(
                              name: "Max Cirro Slides",
                              image: "assets/images/product2.png",
                              price: "100.97",
                              newPrice: "55",
                              hasDiscount: true,
                              category: "Men"),
                          Product(
                              name: "Men's Coaches Jacket",
                              image: "assets/images/product3.png",
                              price: "66.97",
                              hasDiscount: false,
                              category: "Men"),
                        ],
                      );
                    },
                  ),
                );
              },
              text: "Hoodies",
            ),
            CategoryCard(
              image: "assets/images/accessories.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CategoriesGeneralScreen(
                        category: "Accessories",
                        categoryItems: [
                          Product(
                              name: "Men's Harrington Jacket",
                              image: "assets/images/product1.png",
                              price: "148",
                              hasDiscount: false,
                              category: "Men"),
                          Product(
                              name: "Max Cirro Slides",
                              image: "assets/images/product2.png",
                              price: "100.97",
                              newPrice: "55",
                              hasDiscount: true,
                              category: "Men"),
                          Product(
                              name: "Men's Coaches Jacket",
                              image: "assets/images/product3.png",
                              price: "66.97",
                              hasDiscount: false,
                              category: "Men"),
                        ],
                      );
                    },
                  ),
                );
              },
              text: "Accessories",
            ),
            CategoryCard(
              image: "assets/images/shorts.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CategoriesGeneralScreen(
                        category: "Shorts",
                        categoryItems: [
                          Product(
                              name: "Men's Harrington Jacket",
                              image: "assets/images/product1.png",
                              price: "148",
                              hasDiscount: false,
                              category: "Men"),
                          Product(
                              name: "Max Cirro Slides",
                              image: "assets/images/product2.png",
                              price: "100.97",
                              newPrice: "55",
                              hasDiscount: true,
                              category: "Men"),
                          Product(
                              name: "Men's Coaches Jacket",
                              image: "assets/images/product3.png",
                              price: "66.97",
                              hasDiscount: false,
                              category: "Men"),
                        ],
                      );
                    },
                  ),
                );
              },
              text: "Shorts",
            ),
            CategoryCard(
              image: "assets/images/shoes.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CategoriesGeneralScreen(
                        category: "Shoes",
                        categoryItems: [
                          Product(
                              name: "Men's Harrington Jacket",
                              image: "assets/images/product1.png",
                              price: "148",
                              hasDiscount: false,
                              category: "Men"),
                          Product(
                              name: "Max Cirro Slides",
                              image: "assets/images/product2.png",
                              price: "100.97",
                              newPrice: "55",
                              hasDiscount: true,
                              category: "Men"),
                          Product(
                              name: "Men's Coaches Jacket",
                              image: "assets/images/product3.png",
                              price: "66.97",
                              hasDiscount: false,
                              category: "Men"),
                        ],
                      );
                    },
                  ),
                );
              },
              text: "Shoes",
            ),
            CategoryCard(
              image: "assets/images/bags.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CategoriesGeneralScreen(
                        category: "Bags",
                        categoryItems: [
                          Product(
                              name: "Men's Harrington Jacket",
                              image: "assets/images/product1.png",
                              price: "148",
                              hasDiscount: false,
                              category: "Men"),
                          Product(
                              name: "Max Cirro Slides",
                              image: "assets/images/product2.png",
                              price: "100.97",
                              newPrice: "55",
                              hasDiscount: true,
                              category: "Men"),
                          Product(
                              name: "Men's Coaches Jacket",
                              image: "assets/images/product3.png",
                              price: "66.97",
                              hasDiscount: false,
                              category: "Men"),
                        ],
                      );
                    },
                  ),
                );
              },
              text: "Bags",
            ),
          ],
        ),
      ),
    );
  }
}
