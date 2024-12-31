import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/widgets/app_button.dart';
import 'package:store_app/widgets/notification_card.dart';

class UserMainBody2 extends StatelessWidget {
  const UserMainBody2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      "Gilbert, you placed and order. Check your order history for full details",
      "Gilbert, thank you for shopping with us. We have cancelled your order #24586",
      "Gilbert, your order #24586 has been confirmed. Check your order history for full detials",
    ];
    final screenSize = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notifications",
          style: TextStyle(
              color: isLightTheme ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: notifications.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                    icon: Icons.notifications_none,
                    text: notifications[index],
                    onTap: null,
                  );
                },
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      child: Image.asset("assets/images/notification.png")),
                  const SizedBox(height: 24),
                  Text(
                    "No Notifications yet",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 32, horizontal: screenSize.width * 0.27),
                    child: AppButton(
                        screenSize: screenSize,
                        onTap: () {
                          Navigator.pushNamed(context, "/categories");
                        },
                        text: "Explore Categories"),
                  ),
                ],
              ),
            ),
    );
  }
}
