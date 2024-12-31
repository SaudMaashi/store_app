import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_search_bar.dart';
import 'package:store_app/widgets/category_card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _results = [
    "hoodies",
    "accessories",
    "shorts",
    "shoes",
    "bags",
  ];

  var _searchResult = "";
  @override
  Widget build(BuildContext context) {
    final filteredResults = _results
        .where(
            (item) => item.toLowerCase().contains(_searchResult.toLowerCase()))
        .toList();

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenSize.width * 0.2,
        toolbarHeight: screenSize.width * 0.18,
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Column(
          children: [
            AppSearchBar(
              text: "Search Categories",
              onChanged: (value) {
                setState(() {
                  _searchResult = value;
                });
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: filteredResults.isEmpty
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: screenSize.height * 0.15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                child: Image.asset(
                                    "assets/images/notification.png")),
                            const SizedBox(height: 24),
                            Text(
                              "Sorry, we couldn't find any matching result for your search.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView(
                      children: filteredResults.map((item) {
                        return CategoryCard(
                          image: "assets/images/$item.png",
                          text: item,
                          onTap: () {
                            Navigator.pushNamed(
                                context, "/${item.toLowerCase()}");
                          },
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
