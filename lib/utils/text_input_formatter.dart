import 'package:flutter/services.dart';

class LowerCaseTextFormatter implements TextInputFormatter {
  const LowerCaseTextFormatter();
  
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
