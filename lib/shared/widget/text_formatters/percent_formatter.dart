import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PercentInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text.replaceAll('%', ''));

    //final formatter = NumberFormat.percentPattern('pt-br');
    //String newText = formatter.format(value / 100);

    return TextEditingValue(
      text: value.toString(),
      selection: TextSelection.collapsed(offset: newValue.selection.baseOffset),
    );
  }
}
