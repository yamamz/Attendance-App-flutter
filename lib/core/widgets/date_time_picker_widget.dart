import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GenericDatePicker extends StatelessWidget {
  final TextEditingController editingController;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType inputType;
  final bool isRequired;
  final bool obscureText;
  final bool enable;
  final String format;
  final DateTime initialValue;
  final DateTime firstDate;
  final DateTime lastDate;

  final FocusNode focusNode;
  final Function(DateTime) onFieldSubmitted;
  final Function(DateTime) onChanged;

  const GenericDatePicker({
    this.editingController,
    @required this.label,
    this.obscureText = false,
    this.inputType = TextInputType.text,
    this.isRequired = false,
    this.icon,
    this.hint,
    this.enable = true,
    this.format = 'yyyy-MM-dd',
    this.initialValue,
    this.firstDate,
    this.lastDate,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 16),
        ),
        DateTimeField(
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          initialValue: initialValue,
          enabled: enable,
          format: DateFormat(format),
          controller: editingController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            hintText: hint,
            suffixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(
                      icon,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : null,
          ),
          onShowPicker: (BuildContext context, DateTime currentValue) {
            return showDatePicker(
                context: context,
                firstDate: firstDate ?? DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: lastDate ?? DateTime(3000),
                builder: (BuildContext context, Widget child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                        textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
                            headline:
                                GoogleFonts.nunitoSansTextTheme().headline)),
                    child: child,
                  );
                });
          },
          validator: (DateTime value) {
            if (isRequired && value == null) {
              return 'text field is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
