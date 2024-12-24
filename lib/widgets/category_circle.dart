import 'package:flutter/material.dart';

class CategoryCircle extends StatelessWidget {
  const CategoryCircle({
    super.key,
    required this.image,
    this.onTap,
  });

  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}
