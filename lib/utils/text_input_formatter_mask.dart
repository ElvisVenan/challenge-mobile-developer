import 'package:flutter/services.dart';

class TextInputFormatterMask extends TextInputFormatter {
  final String numberOfCharactersDefinedForInputText;
  final String firstNumberSeparatorDefined;
  final String? secondNumberSeparatorDefined;
  final String? thirdNumberSeparatorDefined;

  TextInputFormatterMask({
    required this.numberOfCharactersDefinedForInputText,
    required this.firstNumberSeparatorDefined,
    this.secondNumberSeparatorDefined,
    this.thirdNumberSeparatorDefined,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {

    if (newValue.text.length > oldValue.text.length) {

      if (newValue.text.length < numberOfCharactersDefinedForInputText.length &&
          numberOfCharactersDefinedForInputText[newValue.text.length - 1] == firstNumberSeparatorDefined) {
        return TextEditingValue(
          text:
              '${oldValue.text}$firstNumberSeparatorDefined${newValue.text.substring(newValue.text.length - 1)}',
          selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }

      if (newValue.text.length < numberOfCharactersDefinedForInputText.length &&
          numberOfCharactersDefinedForInputText[newValue.text.length - 1] == secondNumberSeparatorDefined) {
        return TextEditingValue(
          text:
              '${oldValue.text}$secondNumberSeparatorDefined${newValue.text.substring(newValue.text.length - 1)}',
          selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }

      if (newValue.text.length < numberOfCharactersDefinedForInputText.length &&
          numberOfCharactersDefinedForInputText[newValue.text.length - 1] == thirdNumberSeparatorDefined) {
        return TextEditingValue(
          text:
              '${oldValue.text}$thirdNumberSeparatorDefined${newValue.text.substring(newValue.text.length - 1)}',
          selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }

      if (newValue.text.length > numberOfCharactersDefinedForInputText.length) return oldValue;
    }

    return newValue;
  }

  static String unmaskText(String cpf) {
    return cpf
        .replaceAll(".", "")
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "");
  }
}
