import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/product_card.dart';

class CategoriesGeneralScreen extends StatelessWidget {
  const CategoriesGeneralScreen({
    super.key,
    required this.category,
    required this.categoryItems,
  });

  final String category;
  final List<Product> categoryItems;

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
                  Text(
                    "$category (${categoryItems.length}) ",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Flexible(
                child: GridView.builder(
                  itemCount: categoryItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      isExpanded: false,
                      product: categoryItems[index],
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
