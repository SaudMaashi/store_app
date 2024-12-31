import 'package:flutter/material.dart';
import 'package:store_app/widgets/order_card.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({
    super.key,
    required this.orders,
    required this.onTap,
  });

  final List<dynamic> orders;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(
          prefixIcon: Icons.receipt,
          suffixIcon: Icons.arrow_right,
          text: orders[index][0],
          onTap: onTap,
          subText: orders[index][1],
        );
      },
    );
  }
}
