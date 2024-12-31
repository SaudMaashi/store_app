import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
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
            leading: Icon(icon),
            title: Text(text),
          ),
        ),
      ),
    );
  }
}
