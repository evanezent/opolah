import 'package:flutter/material.dart';
import 'package:opolah/config/constants.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    required this.text,
    this.bgColor = colorPrimary,
    this.textColor = colorWhite,
    this.fontSize = 14,
    this.callback,
    this.append,
    this.borderColor,
  }) : super(key: key);

  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final Color? borderColor;
  final String text;
  final Function? callback;
  final Widget? append;

  Widget children() {
    return append == null
        ? Text(
            text,
            style: TextStyle(color: textColor),
          )
        : Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: [
              append!,
              width8,
              Text(
                text,
                style: TextStyle(color: textColor),
              )
            ],
          );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(bgColor),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(color: textColor),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: buttonStyle(), onPressed: callback!(), child: children());
  }
}
