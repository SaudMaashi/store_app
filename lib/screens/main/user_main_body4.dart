import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/widgets/profile_card.dart';

@override
class UserMainBody4 extends StatelessWidget {
  const UserMainBody4({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
              vertical: screenSize.height * 0.07,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                        themeProvider.toggleTheme();
                      },
                      child: Icon(
                          isLightTheme ? Icons.dark_mode : Icons.light_mode),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 38,
                  backgroundImage: AssetImage("assets/images/men.png"),
                  foregroundImage: AssetImage("assets/images/men.png"),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Saud Maashi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "saudm45q@gmail.com",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF8E8E8E)),
                              ),
                              Text(
                                "+966567600492",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF8E8E8E)),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                // To be implemeneted
                              },
                              child: const Text("Edit")),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ProfileCard(
                      onTap: () {
                        Navigator.pushNamed(context, "/address");
                      },
                      text: "Address"),
                ),
                SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ProfileCard(
                      onTap: () {
                        Navigator.pushNamed(context, "/wishlist");
                      },
                      text: "Wishlist"),
                ),
                SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ProfileCard(
                      onTap: () {
                        Navigator.pushNamed(context, "/payment");
                      },
                      text: "Payment"),
                ),
                SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ProfileCard(
                      onTap: () {
                        Navigator.pushNamed(context, "/help");
                      },
                      text: "Help"),
                ),
                SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ProfileCard(
                      onTap: () {
                        Navigator.pushNamed(context, "/support");
                      },
                      text: "Support"),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // To be implemeneted
                  },
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
