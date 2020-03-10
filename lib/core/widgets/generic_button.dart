import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../constants/style_constants.dart';

class GenericButton extends StatefulWidget {
  const GenericButton(
      {@required this.label,
      @required this.onClick,
      this.backgroundColor = PRIMARY_BUTTON_COLOR,
      this.textColor = BUTTON_DEFAULT_FONT_COLOR,
      this.isBusy = false,
      this.isPadded = true});

  final String label;
  final Color textColor;
  final Color backgroundColor;
  final Function() onClick;
  final bool isBusy;
  final bool isPadded;

  @override
  _GenericButtonState createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onPressed: widget.isBusy ? null : widget.onClick,
            padding: widget.isPadded
                ? const EdgeInsets.symmetric(horizontal: 48, vertical: 12)
                : const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            color: widget.backgroundColor,
            disabledColor: PRIMARY_BUTTON_DISABLED_COLOR,
            child: Row(
              children: <Widget>[
                Text(widget.label,
                    style: TextStyle(color: widget.textColor, fontWeight: FontWeight.bold, fontSize: 16)),
                _paddedLoading(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _paddedLoading() {
    if (widget.isBusy) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 16,
          ),
          SizedBox(
            height: SIZE_VALUE_20,
            width: SIZE_VALUE_20,
            child: const CircularProgressIndicator(
              // backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
