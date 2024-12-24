import 'package:flutter/material.dart';
import 'package:store_app/widgets/category_circle.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 85,
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: const Color(0xFFF4F4F4),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CategoryCircle(image: image),
            title: Text(text),
          ),
        ),
      ),
    );
  }
}
