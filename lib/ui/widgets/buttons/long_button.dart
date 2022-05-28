import 'package:flutter/material.dart';
import 'package:opolah/config/constants.dart';
import 'package:opolah/config/size_config.dart';

class LongButton extends StatelessWidget {
  const LongButton(
      {Key? key,
      required this.width,
      required this.title,
      this.bgColor = colorWhite,
      this.textColor = colorPrimary,
      this.loading = false,
      this.borderRadius = 40,
      this.borderColor,
      this.onClick,
      this.append})
      : super(key: key);

  final double width;
  final String title;
  final Color bgColor, textColor;
  final bool loading;
  final double borderRadius;
  final Function? onClick;
  final Widget? append;
  final Color? borderColor;

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(8.0),
      primary: bgColor,
      shape: RoundedRectangleBorder(
        side: borderColor == null
            ? BorderSide.none
            : BorderSide(color: borderColor!),
        borderRadius: BorderRadius.circular(10.0),
      ),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Widget children() {
    return append == null
        ? Text(
            title,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: textColor),
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            append!,
            const SizedBox(width: 15),
            Flexible(
              child: Text(
                title,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor),
              ),
            ),
          ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: onClick!(),
      style: buttonStyle(),
      child: AnimatedContainer(
          width: loading ? 80 : width,
          height: size.width < 400
              ? size.width * 0.09
              : size.width > 660
                  ? size.width * 0.05
                  : size.width * 0.08,
          duration: const Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    backgroundColor: bgColor,
                    valueColor: AlwaysStoppedAnimation(textColor),
                  )
                : children(),
          )),
    );
  }
}
