import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/calander_model.dart';

class CalanderWidget extends StatelessWidget {
  const CalanderWidget({
    super.key,
    required this.model,
  });
  final CalanderModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 100,
      padding: const EdgeInsets.only(top: 13.88, bottom: 9.26),
      decoration: ShapeDecoration(
        color: model.isselect ? Colors.white : kbackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.51),
        ),
      ),
      child: Column(
        children: [
          Text(
            model.daytxt,
            style: StylesData.font12.copyWith(color: const Color(0xFF94949D)),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            model.dayNum.toString(),
            style: StylesData.font16.copyWith(
              color: const Color(0xFF292932),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          if (model.isselect)
            const CircleAvatar(
              radius: 2,
              backgroundColor: Colors.red,
            )
        ],
      ),
    );
  }
}
