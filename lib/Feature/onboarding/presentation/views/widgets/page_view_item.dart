import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

Widget pageViewItem({
  required String image,
  required String title,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConfig.screenHeight! * .34,
          child: Center(
              child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
          )),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * .08,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: StylesData.font28,
        ),
      ],
    );
