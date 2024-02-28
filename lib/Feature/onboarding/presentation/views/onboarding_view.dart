import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/local/cache_Helper.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';
import 'package:tqniaapp/Feature/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kbackColor,
        backgroundColor: kbackColor,
        surfaceTintColor: kbackColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: InkWell(
              onTap: () {
                CacheHelper.saveData(key: 'onBoarding', value: true)
                    .then((value) {
                  Nav(context, const LoginView());
                });
              },
              child: Row(
                children: [
                  Text(
                    "Skip",
                    style: StylesData.font17.copyWith(color: kMainColor),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: kMainColor,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}
