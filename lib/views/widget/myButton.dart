import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  var func;
  String title;
  MyButton({
    required this.func,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all(5),
        backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(255, 238, 118, 118),
        ),
      ),
      onPressed: () {
        func();
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          '${title}',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / (23.6),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
