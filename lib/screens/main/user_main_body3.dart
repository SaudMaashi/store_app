import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/general.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/widgets/app_button.dart';
import 'package:store_app/widgets/orders_list.dart';

class UserMainBody3 extends StatefulWidget {
  const UserMainBody3({super.key});

  @override
  State<UserMainBody3> createState() => _UserMainBody3State();
}

class _UserMainBody3State extends State<UserMainBody3> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;
    final generalProvider = Provider.of<GeneralProvider>(context);
    final random = Random();
    int randomNumber = 100000 + random.nextInt(900000);
    final orders = [
      [
        "Order #$randomNumber",
        "4 item(s)",
      ],
      [
        "Order #${randomNumber - 79}",
        "2 item(s)",
      ],
      [
        "Order #${randomNumber - 49}",
        "1 item(s)",
      ],
    ];

    final choices = [
      "Processing",
      "Shipped",
      "Delivered",
      "Returned",
      "Cancelled",
    ];

    final screens = [
      OrdersList(
        orders: orders,
        onTap: () {
          Navigator.pushNamed(
            context,
            "/order_details",
            arguments: {"order": orders[0][0]},
          );
        },
      ),
      OrdersList(
        orders: orders,
        onTap: () {},
      ),
      OrdersList(
        orders: orders,
        onTap: () {},
      ),
      OrdersList(
        orders: orders,
        onTap: () {},
      ),
      OrdersList(
        orders: orders,
        onTap: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Orders",
          style: TextStyle(color: isLightTheme ? Colors.black : Colors.white),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        onPageChanged: (value) {
          generalProvider.setSelectedDetails = choices[value];
        },
        controller: Provider.of<GeneralProvider>(context).pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: choices.map(
                      (details) {
                        final isLastChoice = details == choices.last;
                        return Padding(
                          padding:
                              EdgeInsets.only(right: isLastChoice ? 0 : 10),
                          child: ChoiceChip(
                            shadowColor: Colors.transparent,
                            selectedShadowColor: Colors.transparent,
                            label: Text(
                              details,
                              style: TextStyle(
                                fontSize: 17,
                                color:
                                    generalProvider.selectedDetails == details
                                        ? Colors.white
                                        : isLightTheme
                                            ? Colors.black
                                            : Colors.white,
                              ),
                            ),
                            selected:
                                generalProvider.selectedDetails == details,
                            onSelected: (bool isSelected) {
                              if (isSelected) {
                                generalProvider.setSelectedDetails = details;
                                generalProvider.jumpToPage(index);
                              }
                            },
                            selectedColor: const Color(0xFF8E6CEF),
                            labelStyle: TextStyle(
                              color: isLightTheme ? Colors.black : Colors.white,
                            ),
                            backgroundColor: isLightTheme
                                ? const Color(0xFFF4F4F4)
                                : const Color(0xFF342F3F),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Expanded(
                  child: orders.isNotEmpty
                      ? screens[index]
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  child: Image.asset("assets/images/cart.png")),
                              const SizedBox(height: 24),
                              Text(
                                "No Orders yet",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 32,
                                    horizontal: screenSize.width * 0.23),
                                child: AppButton(
                                    screenSize: screenSize,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/categories");
                                    },
                                    text: "Explore Categories"),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
