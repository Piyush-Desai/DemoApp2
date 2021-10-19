import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum ButtonType { RaisedButton, FlatButton, OutlineButton }

class TimerButton extends StatefulWidget {
  /// Create a TimerButton button.
  ///
  /// The [label], [onPressed], and [timeOutInSeconds]
  /// arguments must not be null.

  final String? label;

  final int? timeOutInSeconds;

  ///[onPressed] Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// Defines the button's base colors
  final Color color;

  /// The color to use for this button's text when the button is disabled.
  final Color? disabledColor;

  final TextStyle activeTextStyle;

  final TextStyle disabledTextStyle;

  final ButtonType buttonType;

  const TimerButton({Key? key,

    @required this.label,
    @required this.onPressed,
    @required this.timeOutInSeconds,
    this.color = Colors.blue,
    this.disabledColor,
    this.buttonType = ButtonType.RaisedButton,
    this.activeTextStyle = const TextStyle(color: Colors.white),
    this.disabledTextStyle = const TextStyle(color: Colors.black45),
  }) : super(key: key);

  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  bool timeUpFlag = false;
  String timeText = "0s";
  int timeCounter = 0;

  //Timer timer = new Timer(duration, callback)

  @override
  void initState() {
    super.initState();
    timeCounter = widget.timeOutInSeconds!;
    timeText = "${timeCounter}s";
    timerUpdate();
  }

  timerUpdate() {
    Timer(const Duration(seconds: 1), () async {

      if(mounted) {
        setState(() {
          timeCounter--;
          timeText = "${timeCounter}s";
        });
        if (timeCounter != 0) {
          timerUpdate();
        } else {
          timeUpFlag = true;
        }
      }
    });
  }

  Widget getChild() {
    return Container(
      child: timeUpFlag
          ? Text(
        "    " + widget.label! + "    ",
        style: (widget.buttonType == ButtonType.OutlineButton)
            ? widget.activeTextStyle.copyWith(color: widget.color)
            : widget.activeTextStyle,
      )
          : Text(widget.label! + " |  " + timeText, style: widget.disabledTextStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case ButtonType.RaisedButton:
        return RaisedButton(
            disabledColor: widget.disabledColor,
            elevation: 0.0,
            color: widget.color,
            onPressed: timeUpFlag
                ? () {
              widget.onPressed!();
              timeCounter = widget.timeOutInSeconds!;
              timeUpFlag = false;
              timerUpdate();
            }
                : null,
            child: getChild());
      case ButtonType.FlatButton:
        return FlatButton(
            color: widget.color,
            disabledColor: widget.disabledColor,
            onPressed: timeUpFlag
                ? () {
              widget.onPressed!();

            }
                : null,
            child: getChild());
      case ButtonType.OutlineButton:
        return OutlineButton(
            borderSide: BorderSide(
              color: widget.color,
            ),
            disabledBorderColor: widget.disabledColor,
            onPressed: timeUpFlag
                ? () {
              widget.onPressed!();
            }
                : null,
            child: getChild());
    }

  }
}