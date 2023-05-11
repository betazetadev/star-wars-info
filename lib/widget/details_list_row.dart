import 'package:flutter/material.dart';

Widget detailsRowWidget(
    BuildContext context, String title, String value, TextStyle? textStyle) {
  textStyle ??= Theme.of(context).textTheme.bodySmall;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(title),
      Text(
        value,
        style: textStyle,
      ),
    ],
  );
}
