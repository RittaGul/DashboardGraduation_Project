import 'package:flutter/material.dart';
import 'package:dashbord/core/themes/Theme.dart';

class inputFaild extends StatelessWidget {
  TextEditingController? textEditingController;
  int? maxLength;
  int? maxLines;
  String title;
  String hintText;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  inputFaild({
    this.maxLength,
    this.maxLines,
    required this.title,
    this.textEditingController,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}',
            style: Themes().headLine1.copyWith(
                  fontSize: MediaQuery.of(context).size.width / (16.6),
                ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            keyboardType: keyboardType ?? TextInputType.text,
            controller: textEditingController,
            readOnly: suffixIcon == null ? false : true,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: '${hintText}',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 238, 118, 118),
                ),
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
