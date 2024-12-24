import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  var _selectedGender = "Men";
  get selectedGender => _selectedGender;
  set setSelectedGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }
}
