import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Category',
          ),
        ],
      ),
    );
  }
}
