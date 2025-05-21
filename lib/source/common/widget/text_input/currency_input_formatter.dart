import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  late final NumberFormat numberFormat;

  CurrencyInputFormatter._();

  factory CurrencyInputFormatter({
    String locale = 'vi_VN',
    String currency = 'đ',
  }) {
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: currency,
      decimalDigits: 0,
    );
    return CurrencyInputFormatter._()..numberFormat = formatter;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // Remove existing formatting to avoid conflicts
    String numericOnly = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    // Convert to integer to apply formatting
    int? valueAsInt = int.tryParse(numericOnly);
    valueAsInt ??= 0;

    // Apply formatting
    String formattedValue = numberFormat.format(valueAsInt);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length - 2),
    );
  }
}
