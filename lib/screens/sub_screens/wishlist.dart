import 'package:flutter/material.dart';
import 'package:store_app/dummy_data/dummy.dart';
import 'package:store_app/screens/sub_screens/product_information.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenSize.width * 0.2,
        toolbarHeight: screenSize.width * 0.18,
        leading: const AppBackButton(),
        title: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            "Wishlist",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.49,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return ProductCard(
                  isExpanded: false,
                  product: products[index],
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProductInformationScreen();
                    }));
                  });
            }),
      ),
    );
  }
}
