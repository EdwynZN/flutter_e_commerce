extension NumberParser on num {
  /// Convert this num to a String in the format of thousand with decimals
  ///
  /// Example:
  /// 
  /// If [separator] is provided, every 3 numbers (a thousand) will write that value, defaults to ','
  /// 
  /// If [decimalPad] is provided, it will add right zeroes to the decimals.
  /// If [decimalPad] is already smaller than or equal to the length of decimals, no padding is added
  /// x
  /// ```dart
  /// const number = 3200.9;
  /// final result = number.thousandSeparator(); // 3,200.900
  /// final result = number.thousandSeparator(decimalPad: 0); // 3,200.9
  /// final result = number.thousandSeparator(separator = ' ', decimalPad: 6); // 3 200.900000
  /// ```
  String thousandSeparator({
    String separator = ',',
    int decimalPad = 3,
  }) {
    final String value = toString();
    final dotIndex = value.indexOf('.');
    String? dec;
    String numbers = value;
    if (dotIndex > 0) {
      dec = value.substring(dotIndex);
      numbers = value.substring(0, dotIndex);
    }
    final buffer = StringBuffer('');
    if (numbers.length > 3) {
      for (int i = 0; i < numbers.length; i++) {
        if (i != 0 && (numbers.length - i) % 3 == 0) buffer.write(separator);
        buffer.write(numbers[i]);
      }
    } else {
      buffer.write(numbers);
    }
    if (decimalPad > 0) {
      if (dec != null) {
        buffer.write(dec.padRight(decimalPad + 1, '0'));
      } else {
        buffer..write('.')..write('0' * decimalPad);
      }
    }
    return buffer.toString();
  }
}
