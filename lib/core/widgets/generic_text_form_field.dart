import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/color_constant.dart';
import '../constants/string_constants.dart';
import '../utils/email_validator.dart';

class GenericTextFormField extends StatelessWidget {
  const GenericTextFormField({
    @required this.editingController,
    @required this.label,
    this.obscureText = false,
    this.inputType = TextInputType.text,
    this.isRequired = false,
    this.icon,
    this.hint,
    this.isBusy = false,
  });

  final TextEditingController editingController;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType inputType;
  final bool isRequired;
  final bool obscureText;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: PRIMARY_COLOR, fontSize: 16),
        ),
        TextFormField(
          keyboardType: inputType,
          enabled: !isBusy,
          cursorColor: PRIMARY_COLOR,
          validator: (String value) {
            if (isRequired && value == '') {
              return ERR_REQUIRED_MSG;
            }
            if (inputType == TextInputType.emailAddress && !EmailValidator.validate(value)) {
              return ERR_INVALID_EMAIL;
            }
            return null;
          },
          controller: editingController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
