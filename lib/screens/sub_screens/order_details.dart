import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/dummy_data/products.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/screens/sub_screens/items_general.dart';
import 'package:store_app/widgets/app_back_button.dart';
import 'package:store_app/widgets/app_list_tile.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final screenSize = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenSize.width * 0.2,
        toolbarHeight: screenSize.width * 0.18,
        leading: const AppBackButton(),
        title: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            arguments!["order"],
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isLightTheme ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.3,
              child: ListView(
                children: const [
                  AppListTile(
                    leading: CircleAvatar(
                        backgroundColor: Color(0xFFEFEAF5),
                        foregroundColor: Colors.white,
                        child: Icon(Icons.check)),
                    title: Text("Delivered",
                        style: TextStyle(color: Color(0xFF939393))),
                    trailing: Text("28 May",
                        style: TextStyle(color: Color(0xFF939393))),
                  ),
                  SizedBox(height: 8),
                  AppListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF8E6CEF),
                      foregroundColor: Colors.white,
                      child: Icon(Icons.check),
                    ),
                    title: Text("Shipped",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Text("28 May",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 8),
                  AppListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF8E6CEF),
                      foregroundColor: Colors.white,
                      child: Icon(Icons.check),
                    ),
                    title: Text("Order Confirmed",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Text("28 May",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 8),
                  AppListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF8E6CEF),
                      foregroundColor: Colors.white,
                      child: Icon(Icons.check),
                    ),
                    title: Text("Order Placed",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Text("28 May",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10),
              child: Row(
                children: [
                  Text("Order Items",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Center(
                  child: ListTile(
                    leading: const Icon(Icons.receipt),
                    title: const Text("4 item(s)"),
                    trailing: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return ItemsGeneralScreen(
                                    itemsName: "Items",
                                    categoryItems: products);
                              },
                            ),
                          );
                        },
                        child: const Text("View All")),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10),
              child: Row(
                children: [
                  Text("Shipping Details",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
              width: double.infinity,
              child: const Card(
                elevation: 0,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 24, bottom: 24, left: 24, right: 64),
                    child: Text(
                      "2715 Ash Dr. San Jose, South Dakota 83475 121-224-7890",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
