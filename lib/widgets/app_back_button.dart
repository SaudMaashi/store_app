import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_container.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 32, top: 24),
        child: AppContainer(
          color: const Color(0xFFF4F4F4),
          child: Icon(
              Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
              color: const Color(0xFF272727)),
        ),
      ),
    );
  }
}
