import 'package:flutter/material.dart';

DropDownMenu(
    {required List<String> ListInfo, required selectedInfo, required func}) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
    ),
    value: selectedInfo,
    items: ListInfo.map(
      (e) => DropdownMenuItem<String>(
        child: Text('$e'),
        value: e,
      ),
    ).toList(),
    onChanged: func,
  );
}
