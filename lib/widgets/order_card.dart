import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.text,
    required this.onTap,
    required this.subText,
  });

  final IconData prefixIcon;
  final IconData suffixIcon;
  final String text;
  final String subText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 85,
        width: double.infinity,
        child: Card(
          elevation: 0,
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Icon(prefixIcon),
            title: Text(text),
            subtitle: Text(subText),
            trailing: Icon(suffixIcon),
          ),
        ),
      ),
    );
  }
}
