import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/dummy_data/dummy.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_container.dart';
import 'package:store_app/widgets/choice_card.dart';

class ProductInformationScreen extends StatefulWidget {
  const ProductInformationScreen({super.key});

  @override
  State<ProductInformationScreen> createState() =>
      _ProductInformationScreenState();
}

class _ProductInformationScreenState extends State<ProductInformationScreen> {
  var _isFavorite = false;
  var _selectedSize = "S";
  var _selectedColor = "Blue";
  var _quantity = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenSize.width * 0.2,
        toolbarHeight: screenSize.width * 0.18,
        leading: const AppBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 24, right: 28),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
              child: AppContainer(
                color: isLightTheme
                    ? const Color(0xFFF4F4F4)
                    : const Color(0xFF342F3F),
                child: IconButton(
                  color: _isFavorite ? Colors.red : Colors.black,
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  icon: _isFavorite
                      ? const Icon(Icons.favorite)
                      : Icon(Icons.favorite_border,
                          color: isLightTheme ? Colors.black : Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          "assets/images/product1.png",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "Men's Harrington Jacket",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "\$148",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20, color: const Color(0xFF8E6CEF)),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 85,
                  width: double.infinity,
                  child: ChoiceCard(
                    title: "Size",
                    onTap: () {
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
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Size",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: isLightTheme
                                                  ? Colors.black
                                                  : Colors.white),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {});
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
                                      children: sizes.map((size) {
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
                                                size,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: _selectedSize == size
                                                        ? Colors.white
                                                        : isLightTheme
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ),
                                            selected: _selectedSize == size,
                                            onSelected: (bool isSelected) {
                                              setState(() {
                                                _selectedSize = size;
                                                Navigator.pop(context);
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
                    widget: Text(
                      _selectedSize,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 85,
                  width: double.infinity,
                  child: ChoiceCard(
                    title: "Color",
                    onTap: () {
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
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Color",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: isLightTheme
                                                  ? Colors.black
                                                  : Colors.white),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {});
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
                                      children: colors.map((color) {
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
                                                color,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color:
                                                        _selectedColor == color
                                                            ? Colors.white
                                                            : isLightTheme
                                                                ? Colors.black
                                                                : Colors.white),
                                              ),
                                            ),
                                            selected: _selectedColor == color,
                                            onSelected: (bool isSelected) {
                                              setState(() {
                                                _selectedColor = color;
                                                Navigator.pop(context);
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
                    widget: Text(
                      _selectedColor,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 85,
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Quantity",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith()),
                          Row(
                            children: [
                              FloatingActionButton(
                                  heroTag: "FAB1",
                                  elevation: 0,
                                  onPressed: () {
                                    if (_quantity < 99) {
                                      setState(() {
                                        _quantity++;
                                      });
                                    }
                                  },
                                  child: const Icon(Icons.add)),
                              const SizedBox(width: 16),
                              Text(
                                "$_quantity",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                              ),
                              const SizedBox(width: 16),
                              FloatingActionButton(
                                heroTag: "FAB2",
                                elevation: 0,
                                onPressed: () {
                                  if (_quantity > 0) {
                                    setState(() {
                                      _quantity--;
                                    });
                                  }
                                },
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                  child: Text(
                      "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless."),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 75)),
                  onPressed: () {
                    // To be implemeneted
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$148",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white)),
                        Text("Add to Bag",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
