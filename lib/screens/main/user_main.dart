import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/general_provider.dart';
import 'package:store_app/screens/main/user_main_body1.dart';
import 'package:store_app/screens/main/user_main_body2.dart';
import 'package:store_app/screens/main/user_main_body3.dart';
import 'package:store_app/screens/main/user_main_body4.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  final _choices = ["Men", "Women"];
  var _selectedPage = 0;
  final _searchResults = ["Saud", "Mohammed", "Maashi"];

  @override
  Widget build(BuildContext context) {
    final generalProvider = Provider.of<GeneralProvider>(context);
    return Scaffold(
      body: PageView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          index = _selectedPage;
          switch (index) {
            case 0:
              return UserMainBody1(
                onChanged: (value) {
                  generalProvider.setSelectedGender = value;
                },
                choices: _choices,
                searchResults: _searchResults,
              );
            case 1:
              return const UserMainBody2();
            case 2:
              return const UserMainBody3();
            default:
              return const UserMainBody4();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _selectedPage,
        onTap: (value) {
          setState(() {
            _selectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
