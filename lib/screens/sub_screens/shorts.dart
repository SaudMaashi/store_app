import 'package:flutter/material.dart';
import 'package:store_app/dummy_data/products.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_search_bar.dart';
import 'package:store_app/widgets/product_card.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  var _searchResult = "";

  @override
  Widget build(BuildContext context) {
    final filteredResults = products
        .where((item) =>
            (item.name.toLowerCase()).contains(_searchResult.toLowerCase()))
        .toList();

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenSize.width * 0.2,
        toolbarHeight: screenSize.width * 0.18,
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AppSearchBar(
              text: "Search Shorts",
              onChanged: (value) {
                setState(() {
                  _searchResult = value;
                });
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text("${filteredResults.length} Results Found",
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 24),
            Flexible(
              child: GridView.builder(
                itemCount: filteredResults.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.49,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return ProductCard(
                    isExpanded: false,
                    product: filteredResults[index],
                    onTap: () {},
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
