import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  final List<String> items;
  final String value;

  const MyDropdown({
    super.key,
    required this.items,
    required this.value,
  });

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {

  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      dropdownColor: Colors.cyan,
      items: widget.items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: (String? value) {
        setState(() {
          _selectedValue = value;
        });
      },
      borderRadius: BorderRadius.circular(5),
    );
  }
}