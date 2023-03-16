import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dashbord/core/themes/Theme.dart';

class commandContainer extends StatelessWidget {
  String commandTitle;
  String commandImage;
  Color? colorImage;
  var func;
  var sizeImag;

  commandContainer({
    required this.commandTitle,
    required this.commandImage,
    required this.func,
    this.colorImage,
    this.sizeImag,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        splashColor: Colors.grey[200],
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          func();
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Container(
            width: 400,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                  decoration: BoxDecoration(
                    color: colorImage ?? Color.fromARGB(255, 238, 118, 118),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                // SizedBox(
                //   gbjkhg
                Container(
                  width: 350,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '$commandTitle',
                        style: Themes().headLine1.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SvgPicture.asset(
                        '$commandImage',
                        color: colorImage ?? Color.fromARGB(255, 238, 118, 118),
                        width: sizeImag ?? 60,
                        height: sizeImag ?? 60,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
