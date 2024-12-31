import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  var _selectedGender = "Men";
  get selectedGender => _selectedGender;
  set setSelectedGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  final PageController _pageController = PageController();
  get pageController => _pageController;

  void jumpToPage(int index) {
    _pageController.jumpToPage(index);
    notifyListeners();
  }

  var _selectedDetails = "Processing";
  get selectedDetails => _selectedDetails;

  set setSelectedDetails(String details) {
    _selectedDetails = details;
    notifyListeners();
  }
}
