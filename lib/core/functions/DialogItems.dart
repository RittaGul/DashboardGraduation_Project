import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashbord/core/themes/Theme.dart';
import 'package:lottie/lottie.dart';

DialogItems(
    {required BuildContext context,
    required title,
    required content,
    fontSize}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Container(
        alignment: Alignment.center,
        child: Text(
          '$title',
          style: Themes().headLine1.copyWith(fontSize: fontSize ?? 23),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: content,
    ),
  );
}
