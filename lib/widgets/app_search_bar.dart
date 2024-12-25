import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final searchResults = ["Saud", "Mohammed", "Maashi"];

    final isLightTheme = themeProvider.theme == AppTheme.light;

    return FloatingSearchBar(
      isScrollControlled: false,
      margins: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      transition: null,
      backgroundColor:
          isLightTheme ? const Color(0xFFF4F4F4) : const Color(0xFF342F3F),
      backdropColor: Colors.transparent,
      automaticallyImplyBackButton: false,
      borderRadius: BorderRadius.circular(24),
      hintStyle: TextStyle(
        color: isLightTheme ? Colors.black54 : Colors.white70,
      ),
      hint: "Search",
      elevation: 0,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      actions: [
        FloatingSearchBarAction(
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // To Be Implemented
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Container(
          decoration: BoxDecoration(
              color: isLightTheme
                  ? const Color(0xFFF3F3F3)
                  : const Color(0xFF342F3F)),
          width: 1000,
          height: 1000,
          child: ListView(
            children: [
              ...searchResults.map(
                (searchedText) {
                  return InkWell(
                    onTap: () {
                      // To Be Implemented
                    },
                    child: Column(
                      children: [
                        const Divider(),
                        Text(
                          searchedText,
                          style: TextStyle(
                              color: isLightTheme ? Colors.black : Colors.white,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
