import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/noti_screen.dart';

class CustomMainHomePageAppBar extends StatelessWidget {
  const CustomMainHomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 27,
              backgroundImage: AssetImage(AssetsData.person1),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          width: 22,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Mohamed!",
              style: StylesData.font14.copyWith(color: const Color(0xFF7E7E7E)),
            ),
            Text(
              "Thursday, 29 Jan",
              style: StylesData.font18,
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            NavegatorPush(context, const NotificationScreen());
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 29,
                backgroundColor: const Color(0xFF040415).withOpacity(0.10),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Center(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const ImageIcon(AssetImage(AssetsData.notification)),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: kMainColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
