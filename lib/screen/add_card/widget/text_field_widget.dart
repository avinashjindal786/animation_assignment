


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key, this.onChange, this.onSubmitted, this.formatter, required this.cardNumber, this.hintText, required this.textType, required this.width, required this.name, required this.limit
      // required this.maxLength,
      });

  final TextEditingController cardNumber;
  final String? hintText;
  final TextInputType textType;
  final double width;
  final String name;
  final int limit;
  String? Function(String?)? onChange;
  String? Function(String?)? onSubmitted;
  List<TextInputFormatter>? formatter;
  // final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        SizedBox(
          height: 40,
          width: width,
          child: TextField(
            controller: cardNumber,
            onChanged: onChange,
            keyboardType: textType,
            onSubmitted: onSubmitted,
            // maxLength: maxLength,
            inputFormatters: formatter ??
                [
                  LengthLimitingTextInputFormatter(limit),
                ],
            cursorColor: Colors.white.withOpacity(0.7),
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white.withOpacity(0.7)),
            decoration: InputDecoration(
              hintText: hintText ?? "",
              hintStyle: const TextStyle(color: Color(0xFF6d7d81), fontSize: 18),
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white.withOpacity(0.7),
              )),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.7))),
            ),
          ),
        ),
      ],
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: new TextSelection.collapsed(offset: string.length));
  }
}
