import 'package:flutter/material.dart';
import 'package:tentwenty/app/common/colors.dart';

// Re-Usable Text
Text txt({required String txt, color, size, weight, fontStyle, align}) {
  return Text(
    txt,
    style: TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 14.0,
      fontWeight: weight ?? FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
    ),
    textAlign: align ?? TextAlign.start,
  );
}

//height
Widget ph(double height) {
  return SizedBox(
    height: height,
  );
}

//Width
Widget pw(double width) {
  return SizedBox(
    width: width,
  );
}

//container Button
Widget containerbtn({
  required width,
  required height,
  borderColor,
  required bgColor,
  required title,
  required icon,
  click,
  titleSize,
}) {
  return GestureDetector(
    onTap: click,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: icon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.play_arrow,
                  color: MyColors.white,
                ),
                txt(txt: title, color: MyColors.white, size: titleSize ?? 16.0)
              ],
            )
          : Center(
              child: txt(
                  txt: title, color: MyColors.white, size: titleSize ?? 16.0),
            ),
    ),
  );
}
