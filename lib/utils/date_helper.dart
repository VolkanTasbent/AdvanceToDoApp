// utils/date_helper.dart
import 'package:flutter/material.dart';

Future<DateTime?> showDatePickerWithDialog(BuildContext context, DateTime initialDate) async {
  return await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2021),
    lastDate: DateTime(2101),
  );
}
