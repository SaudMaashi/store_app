import 'package:flutter/material.dart';
import 'package:store_app/dummy_data/dummy.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_search_bar.dart';
import 'package:store_app/widgets/product_card.dart';

class BagsScreen extends StatefulWidget {
  const BagsScreen({super.key});

  @override
  State<BagsScreen> createState() => _BagsScreenState();
}

class _BagsScreenState extends State<BagsScreen> {
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
              text: "Search Bags",
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
