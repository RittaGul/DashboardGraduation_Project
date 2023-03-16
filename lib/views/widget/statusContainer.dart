import 'package:flutter/material.dart';
import 'package:dashbord/core/themes/Theme.dart';

class statusContainer extends StatelessWidget {
  String statusName;
  String statusOfNumber;
  statusContainer({
    required this.statusName,
    required this.statusOfNumber,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: const SizedBox(
            // height: 200,
            width: 100,
            child: Divider(
              color: Color.fromARGB(255, 238, 118, 118),
              thickness: 3,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$statusName',
              style: Themes().headLine1.copyWith(
                    fontSize: 20,
                  ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$statusOfNumber',
                  style: Themes().headLine1.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade800,
                      ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'items',
                  style: Themes().headLine1.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 238, 118, 118),
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
