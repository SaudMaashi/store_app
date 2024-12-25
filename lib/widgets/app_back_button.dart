import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme.dart';
import 'package:store_app/widgets/app_container.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isLightTheme = themeProvider.theme == AppTheme.light;

    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 32, top: 24),
        child: AppContainer(
          color:
              isLightTheme ? const Color(0xFFF4F4F4) : const Color(0xFF342F3F),
          child: Icon(
              Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
              color: isLightTheme ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
