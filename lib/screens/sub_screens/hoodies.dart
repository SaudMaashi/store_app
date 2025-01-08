import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/dummy_data/dummy.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/screens/sub_screens/product_information.dart';
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
  final _genders = ["Men", "Women"];
  final _prices = ["Min", "Max"];
  final _sortings = [
    "Recommended",
    "Newest",
    "Lowest-Highest Price",
    "Highest-Lowest Price"
  ];
  String? _selectedGender;
  bool _isIncreasing = true;
  String? _selectedChoice;
  var _isOnSale = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;
    final filteredResults = products
        .where(
          (item) =>
              (item.name.toLowerCase().contains(_searchResult.toLowerCase()) &&
                  (!_isOnSale || item.hasDiscount == _isOnSale) &&
                  (_isIncreasing || !_isIncreasing)),
        )
        .toList();
    if (_selectedChoice == "Min" && _isIncreasing) {
      filteredResults.sort((a, b) => a.price.compareTo(b.price));
    } else if (_selectedChoice == "Max" && !_isIncreasing) {
      filteredResults.sort((a, b) => b.price.compareTo(a.price));
    }

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leadingWidth: screenSize.width * 0.2,
          toolbarHeight: screenSize.width * 0.18,
          leading: const AppBackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
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
                children: [
                  FilterChip(
                    selectedShadowColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    selectedColor: const Color(0xFF8E6CEF),
                    showCheckmark: false,
                    selected: _isOnSale,
                    labelStyle: TextStyle(
                      color: _isOnSale
                          ? Colors.white
                          : isLightTheme
                              ? Colors.black
                              : Colors.white,
                    ),
                    label: const Text(
                      "On Sale",
                      style: TextStyle(fontSize: 16),
                    ),
                    onSelected: (value) {
                      setState(() {
                        _isOnSale = !_isOnSale;
                      });
                    },
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
                      setState(
                        () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                  child: Text(
                                                    "Clear",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: isLightTheme
                                                            ? Colors.black
                                                            : Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    setState(
                                                      () {
                                                        _selectedGender = null;
                                                      },
                                                    );
                                                  },
                                                ),
                                                Text(
                                                  "Price",
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: isLightTheme
                                                          ? Colors.black
                                                          : Colors.white),
                                                ),
                                                TextButton(
                                                  child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: isLightTheme
                                                            ? Colors.black
                                                            : Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    setState(
                                                      () {
                                                        Navigator.pop(context);
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: _prices.map((choice) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8,
                                                          right: 8,
                                                          top: 16),
                                                  child: ChoiceChip(
                                                    labelPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 54,
                                                            vertical: 16),
                                                    shadowColor:
                                                        Colors.transparent,
                                                    selectedShadowColor:
                                                        Colors.transparent,
                                                    label: SizedBox(
                                                      width: double.infinity,
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        choice,
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            color: _selectedGender ==
                                                                    choice
                                                                ? Colors.white
                                                                : isLightTheme
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white),
                                                      ),
                                                    ),
                                                    selected: _selectedGender ==
                                                        choice,
                                                    onSelected:
                                                        (bool isSelected) {
                                                      setState(() {
                                                        if (_selectedGender ==
                                                            choice) {
                                                          _selectedGender =
                                                              null;
                                                        } else {
                                                          _selectedGender =
                                                              choice;
                                                        }
                                                      });
                                                    },
                                                    selectedColor:
                                                        const Color(0xFF8E6CEF),
                                                    labelStyle: TextStyle(
                                                      color: isLightTheme
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                    backgroundColor:
                                                        isLightTheme
                                                            ? const Color(
                                                                0xFFF4F4F4)
                                                            : const Color(
                                                                0xFF342F3F),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
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
                    onSelected: (value) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              child: Text(
                                                "Clear",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: isLightTheme
                                                        ? Colors.black
                                                        : Colors.white),
                                              ),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    _selectedGender = null;
                                                  },
                                                );
                                              },
                                            ),
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: isLightTheme
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _isIncreasing = !_isIncreasing;
                                                _selectedChoice = _isIncreasing
                                                    ? "Min"
                                                    : "Max";
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close,
                                                  size: 28,
                                                  color: isLightTheme
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: _sortings.map((gender) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8, top: 16),
                                              child: ChoiceChip(
                                                labelPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 54,
                                                        vertical: 16),
                                                shadowColor: Colors.transparent,
                                                selectedShadowColor:
                                                    Colors.transparent,
                                                label: SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    gender,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color:
                                                            _selectedGender ==
                                                                    gender
                                                                ? Colors.white
                                                                : isLightTheme
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white),
                                                  ),
                                                ),
                                                selected:
                                                    _selectedGender == gender,
                                                onSelected: (bool isSelected) {
                                                  setState(() {
                                                    if (_selectedGender ==
                                                        gender) {
                                                      _selectedGender = null;
                                                    } else {
                                                      _selectedGender = gender;
                                                    }
                                                  });
                                                },
                                                selectedColor:
                                                    const Color(0xFF8E6CEF),
                                                labelStyle: TextStyle(
                                                  color: isLightTheme
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                backgroundColor: isLightTheme
                                                    ? const Color(0xFFF4F4F4)
                                                    : const Color(0xFF342F3F),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
                          "Gender",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 20,
                        )
                      ],
                    ),
                    onSelected: (value) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              child: Text(
                                                "Clear",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: isLightTheme
                                                        ? Colors.black
                                                        : Colors.white),
                                              ),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    _selectedGender = null;
                                                  },
                                                );
                                              },
                                            ),
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: isLightTheme
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.close,
                                                  size: 28,
                                                  color: isLightTheme
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: _genders.map((choice) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8, top: 16),
                                              child: ChoiceChip(
                                                labelPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 54,
                                                        vertical: 16),
                                                shadowColor: Colors.transparent,
                                                selectedShadowColor:
                                                    Colors.transparent,
                                                label: SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    choice,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color:
                                                            _selectedGender ==
                                                                    choice
                                                                ? Colors.white
                                                                : isLightTheme
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white),
                                                  ),
                                                ),
                                                selected:
                                                    _selectedGender == choice,
                                                onSelected: (bool isSelected) {
                                                  setState(() {
                                                    if (_selectedGender ==
                                                        choice) {
                                                      _selectedGender = null;
                                                    } else {
                                                      _selectedGender = choice;
                                                    }
                                                  });
                                                },
                                                selectedColor:
                                                    const Color(0xFF8E6CEF),
                                                labelStyle: TextStyle(
                                                  color: isLightTheme
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                backgroundColor: isLightTheme
                                                    ? const Color(0xFFF4F4F4)
                                                    : const Color(0xFF342F3F),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ProductInformationScreen();
                          }));
                        });
                  }),
            )
          ]),
        ));
  }
}
