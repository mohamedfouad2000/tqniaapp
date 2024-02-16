import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Profile',
          style: StylesData.font18.copyWith(color: Colors.black),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: kMainColor,
          radius: 28,
          child: const Center(
            child: Image(
              image: AssetImage(AssetsData.Frame),
              height: 34,
              width: 34,
            ),
          ),
        )
      ],
    );
  }
}
