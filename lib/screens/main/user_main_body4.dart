import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme.dart';

@override
class UserMainBody4 extends StatelessWidget {
  const UserMainBody4({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        themeProvider.toggleTheme();
      }),
    );
  }
}
