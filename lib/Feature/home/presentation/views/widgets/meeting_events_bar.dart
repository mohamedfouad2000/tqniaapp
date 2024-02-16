import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

class MeetingsAndEventsBar extends StatelessWidget {
  const MeetingsAndEventsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(9.29),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.16, color: Color(0x4494949D)),
            borderRadius: BorderRadius.circular(13.93),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: ShapeDecoration(
                  color: const Color(0xFFE92929),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.93),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x26484067),
                      blurRadius: 37.14,
                      offset: Offset(0, 9.29),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ImageIcon(
                      AssetImage(
                        AssetsData.calendar,
                      ),
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Meeting',
                      style: StylesData.font16.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF6F6F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.93),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ImageIcon(
                      AssetImage(
                        AssetsData.Events,
                      ),
                      size: 20,
                      color: Color(0xff0D223F),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Events',
                      style: StylesData.font16.copyWith(
                        color: const Color(0xFF94949D),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
