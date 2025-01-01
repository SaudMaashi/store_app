import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/dummy_data/products.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_search_bar.dart';
import 'package:store_app/widgets/product_card.dart';

class HoodiesScreen extends StatefulWidget {
  const HoodiesScreen({super.key});

  @override
  State<HoodiesScreen> createState() => _HoodiesScreenState();
}

class _HoodiesScreenState extends State<HoodiesScreen> {
  var _searchResult = "";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;
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
            const SizedBox(height: 36),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilterChip(
                    selectedShadowColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    label: const Row(
                      children: [
                        Icon(Icons.filter_alt, size: 20),
                        Text(
                          "2",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    onSelected: (value) {},
                  ),
                  const SizedBox(width: 16),
                  FilterChip(
                    selectedShadowColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    label: const Text(
                      "On Sale",
                      style: TextStyle(fontSize: 16),
                    ),
                    onSelected: (value) {},
                  ),
                  const SizedBox(width: 16),
                  FilterChip(
                    selectedShadowColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    label: const Row(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.keyboard_arrow_down_sharp, size: 20),
                      ],
                    ),
                    onSelected: (value) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: const Color(0xFF757575),
                            height: screenSize.height * 0.5,
                            child: Container(
                              height: screenSize.height * 0.5,
                              decoration: BoxDecoration(
                                color: isLightTheme
                                    ? Colors.white
                                    : const Color(0xFF1D182A),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(24),
                                    topLeft: Radius.circular(24)),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  FilterChip(
                    selectedShadowColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    label: const Row(
                      children: [
                        Text(
                          "Sort by",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 20,
                        )
                      ],
                    ),
                    onSelected: (value) {},
                  ),
                  const SizedBox(width: 16),
                  FilterChip(
                    selectedShadowColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    label: const Row(
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 20,
                        )
                      ],
                    ),
                    onSelected: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
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
