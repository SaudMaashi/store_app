import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/dummy_data/products.dart';

import 'package:store_app/providers/general.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/widgets/app_container.dart';
import 'package:store_app/widgets/app_search_bar.dart';
import 'package:store_app/widgets/category_circle.dart';
import 'package:store_app/widgets/category_header.dart';
import 'package:store_app/widgets/product_card.dart';

class UserMainBody1 extends StatefulWidget {
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
  State<UserMainBody1> createState() => _UserMainBody1State();
}

class _UserMainBody1State extends State<UserMainBody1> {
  @override
  Widget build(BuildContext context) {
    final List<CategoryCircle> categories = [
      CategoryCircle(
        image: "assets/images/hoodies.png",
        onTap: () {
          Navigator.pushNamed(context, "/hoodies");
        },
      ),
      CategoryCircle(
        image: "assets/images/shorts.png",
        onTap: () {
          Navigator.pushNamed(context, "/shorts");
        },
      ),
      CategoryCircle(
        image: "assets/images/shoes.png",
        onTap: () {
          Navigator.pushNamed(context, "/shoes");
        },
      ),
      CategoryCircle(
        image: "assets/images/bags.png",
        onTap: () {
          Navigator.pushNamed(context, "/bags");
        },
      ),
      CategoryCircle(
        image: "assets/images/accessories.png",
        onTap: () {
          Navigator.pushNamed(context, "/accessories");
        },
      ),
    ];
    final generalProvider = Provider.of<GeneralProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 32),
      child: ListView(
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
                  items: widget.choices!
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 20,
                                color:
                                    isLightTheme ? Colors.black : Colors.white,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    generalProvider.setSelectedGender = value!;
                  },
                  value: generalProvider.selectedGender,
                  buttonStyleData: const ButtonStyleData(),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: isLightTheme ? Colors.black : Colors.white,
                    ),
                    iconSize: 32,
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
                onTap: () {},
                child: const AppContainer(
                  color: Color(0xFF8E6CEF),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child:
                        Icon(Icons.shopping_bag, color: Colors.white, size: 28),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          CategoryHeader(
            text: "Categories",
            onTap: () {
              Navigator.pushNamed(context, "/categories");
            },
          ),
          SizedBox(
            height: 100,
            width: 100,
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
          CategoryHeader(
              onTap: () {
                // To Be Implemented
              },
              text: "Top Selling"),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCard(
                  isExpanded: true,
                  onTap: () {
                    // To Be Implemented
                  },
                  product: products[index],
                );
              },
            ),
          ),
          CategoryHeader(
              onTap: () {
                // To Be Implemented
              },
              text: "New In"),
          SizedBox(
            height: 410,
            width: double.infinity,
            child: ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCard(
                  isExpanded: true,
                  onTap: () {
                    // To Be Implemented
                  },
                  product: products[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
