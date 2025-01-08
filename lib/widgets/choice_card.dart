import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.widget,
  });

  final VoidCallback onTap;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
          title: Text(title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith()),
          trailing: SizedBox(
            height: 100,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget,
                const SizedBox(width: 16),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
