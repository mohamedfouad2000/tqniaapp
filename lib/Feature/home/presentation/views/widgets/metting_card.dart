import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/add_meeting_form.dart';

class MettingCard extends StatelessWidget {
  const MettingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
              child: Image(
            image: AssetImage(AssetsData.meeting),
            width: 179,
            height: 137,
          )),
          const SizedBox(
            width: 32,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              Container(
                width: 95,
                height: 10,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                width: 163,
                height: 5,
                decoration: ShapeDecoration(
                  color: const Color(0xFFECECEC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: 163,
                height: 5,
                decoration: ShapeDecoration(
                  color: const Color(0xFFECECEC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: 163,
                height: 5,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF9F9F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              defaultButton(
                  height: 41,
                  fun: () {
                    showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return const SingleChildScrollView(
                            child: AddMeetingForm());
                      },
                    );
                  },
                  textWidget: Text(
                    "Add new Meeting",
                    style: StylesData.font10,
                  ),
                  c: kMainColor)
            ],
          )),
        ],
      ),
    );
  }
}
