import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/widgets/line_wid.dart';

class FullMettingScreen extends StatelessWidget {
  const FullMettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              width: double.infinity,
              height: 160,
              padding: const EdgeInsetsDirectional.only(
                  start: 10, end: 10, top: 10, bottom: 10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.49, color: Color(0xFFF4F4F4)),
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x11EA5A5A),
                    blurRadius: 62.86,
                    offset: Offset(14.61, 18.65),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey[200],
                    height: 10,
                    width: 40,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey[200],
                      height: 10,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const LineWidget(),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(1000000),
                          child: Container(
                            height: 24,
                            width: 24,
                            color: Colors.grey[200],
                          )),
                      const SizedBox(
                        width: 5.6,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.grey[200],
                              height: 5,
                              width: 80,
                            ),
                            Container(
                              color: Colors.grey[200],
                              height: 5,
                              width: 80,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                          flex: 2,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[200],
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.grey[200],
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Container(
                width: 8,
                height: 137,
                decoration: ShapeDecoration(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ));
  }
}
