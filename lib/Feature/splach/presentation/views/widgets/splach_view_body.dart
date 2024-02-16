import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';

class SplachViewBody extends StatelessWidget {
  const SplachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsData.splachback,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: const Center(
          child: Image(
            image: AssetImage(
              AssetsData.splachLogo,
            ),
            //  width: 131,
            height: 152,
          ),
        ));
  }
}
