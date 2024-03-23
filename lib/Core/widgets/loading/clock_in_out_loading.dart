import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClockInOutLoading extends StatelessWidget {
  const ClockInOutLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.grey[200],
                ),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.grey[200],
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Container(
              height: 30,
              color: Colors.grey[200],
            )),
          ],
        )),
        const SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.grey[200],
                  height: 60,
                  width: 60,
                ),
               ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey[200],
              height: 20,
              width: 80,
            )
          ],
        ),
      ],
    );
  }
}
