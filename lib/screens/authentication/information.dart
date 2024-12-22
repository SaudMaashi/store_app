import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:store_app/widgets/app_button.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final _choices = ["Men", "Women"];
  String? _selectedChoice;
  final _ageRanges = ["18-24", "25-34", "35-44", "45+"];
  // ignore: unused_field
  String? _selectedAgeRange;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(right: 24, left: 24, top: 130, bottom: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text("Tell us About yourself",
                        style: Theme.of(context).textTheme.displayMedium),
                  ],
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Text("Who do you shop for?",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.normal)),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _choices.map((choice) {
                    return ChoiceChip(
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 64, vertical: 16),
                      shadowColor: Colors.transparent,
                      selectedShadowColor: Colors.transparent,
                      backgroundColor: const Color(0xFFF4F4F4),
                      label: Text(
                        choice,
                        style: const TextStyle(fontSize: 17),
                      ),
                      selected: _selectedChoice == choice,
                      onSelected: (bool isSelected) {
                        setState(() {
                          // Deselect if the same choice is clicked again
                          if (_selectedChoice == choice) {
                            _selectedChoice = null;
                          } else {
                            _selectedChoice = choice;
                          }
                        });
                      },
                      selectedColor: const Color(0xFF8E6CEF),
                      labelStyle: TextStyle(
                        color: _selectedChoice == choice
                            ? Colors.white
                            : Colors.black,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 64),
                Row(
                  children: [
                    Text(
                      "How Old are you?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(
                            color: Color(0xFF8E6CEF), width: 2)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                  hint: const Text(
                    "Age Range",
                    style: TextStyle(fontSize: 14),
                  ),
                  items: _ageRanges
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    _selectedAgeRange = value;
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ],
            ),
            AppButton(
                screenSize: screenSize,
                onTap: () {
                  // To Be Implemeneted
                  Navigator.pushNamed(context, "/user_main");
                },
                text: "Finish"),
          ],
        ),
      ),
    );
  }
}
