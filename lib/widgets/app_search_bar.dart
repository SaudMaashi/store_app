import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required List searchResults,
  }) : _searchResults = searchResults;

  final List _searchResults;

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      margins: const EdgeInsets.symmetric(vertical: 28),
      backgroundColor: const Color(0xFFF4F4F4),
      backdropColor: Colors.transparent,
      automaticallyImplyBackButton: false,
      borderRadius: BorderRadius.circular(24),
      hintStyle: const TextStyle(backgroundColor: Color(0xFFF4F4F4)),
      hint: "Search",
      elevation: 0,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 300),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      debounceDelay: const Duration(milliseconds: 300),
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // To Be Implemeneted
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: _searchResults.map((searchedText) {
            return InkWell(
              onTap: () {
                // To Be Implemeneted
              },
              child: Column(
                children: [
                  const Divider(
                    color: Color(0xFFE7E7E7),
                  ),
                  Text(searchedText),
                  const Divider(
                    color: Color(0xFFE7E7E7),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
