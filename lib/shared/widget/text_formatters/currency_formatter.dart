import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.decimalPattern('pt-br');
    String newText = formatter.format(value);

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newValue.selection.baseOffset + 3),
    );
  }
}
