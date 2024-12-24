import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/providers/general_provider.dart';
import 'package:store_app/widgets/app_container.dart';
import 'package:store_app/widgets/app_search_bar.dart';
import 'package:store_app/widgets/category_circle.dart';
import 'package:store_app/widgets/category_header.dart';
import 'package:store_app/widgets/product_card.dart';

class UserMainBody1 extends StatelessWidget {
  const UserMainBody1({
    super.key,
    this.choices,
    this.onChanged,
    this.searchResults,
  });

  final List<String>? choices;
  final Function(String)? onChanged;
  final List<String>? searchResults;

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: "Men's Harrington Jacket",
        image: "assets/images/product1.png",
        price: "148",
        hasDiscount: false,
      ),
      Product(
        name: "Max Cirro Slides",
        image: "assets/images/product2.png",
        price: "100.97",
        newPrice: "55",
        hasDiscount: true,
      ),
      Product(
        name: "Men's Coaches Jacket",
        image: "assets/images/product3.png",
        price: "66.97",
        hasDiscount: false,
      ),
    ];
    final generalProvider = Provider.of<GeneralProvider>(context);
    final List<CategoryCircle> categories = [
      CategoryCircle(
        image: "assets/images/hoodies.png",
        onTap: () {
          // To Be Implemented
        },
      ),
      CategoryCircle(
        image: "assets/images/shorts.png",
        onTap: () {
          // To Be Implemented
        },
      ),
      CategoryCircle(
        image: "assets/images/shoes.png",
        onTap: () {
          // To Be Implemented
        },
      ),
      CategoryCircle(
        image: "assets/images/bags.png",
        onTap: () {
          // To Be Implemented
        },
      ),
      CategoryCircle(
        image: "assets/images/accessories.png",
        onTap: () {
          // To Be Implemented
        },
      ),
    ];
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        generalProvider.selectedGender == "Men"
                            ? "assets/images/men.png"
                            : "assets/images/women.png"),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(
                              color: Color(0xFF8E6CEF), width: 2)),
                    ),
                    items: choices!
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      generalProvider.setSelectedGender = value!;
                    },
                    value: generalProvider.selectedGender,
                    buttonStyleData: const ButtonStyleData(),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // To Be Implemeneted
                  },
                  child: const AppContainer(
                      color: Color(0xFF8E6CEF),
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.shopping_bag,
                              color: Colors.white, size: 28))),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.12,
              width: double.infinity,
              child: AppSearchBar(searchResults: searchResults!),
            ),
            CategoryHeader(
              text: "Categories",
              onTap: () {
                Navigator.pushNamed(context, "/categories");
              },
            ),
            SizedBox(height: screenSize.height * 0.02),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == categories.length - 1 ? 0 : 33,
                    ),
                    child: categories[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            CategoryHeader(
                onTap: () {
                  // To Be Implemented
                },
                text: "Top Selling"),
            SizedBox(
              height: screenSize.height * 0.45,
              width: double.infinity,
              child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCard(
                    onTap: () {},
                    product: products[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
