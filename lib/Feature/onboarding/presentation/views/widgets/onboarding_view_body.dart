import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tqniaapp/Core/local/cache_Helper.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';
import 'package:tqniaapp/Feature/onboarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController();
  int? index = 0;
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              index = value;
              if (value == 2) {
                setState(() {
                  islast = true;
                });
              } else {
                setState(() {
                  islast = false;
                });
              }
            },
            children: [
              pageViewItem(
                image: AssetsData.onboarding1,
                title: "Let's Get Started",
              ),
              pageViewItem(
                image: AssetsData.onboarding2,
                title: "Your Onboarding Journey Begins!",
              ),
              pageViewItem(
                image: AssetsData.onboarding3,
                title: "Your First Steps to Success",
              )
            ],
          ),
          Positioned(
            bottom: SizeConfig.defaultSize! * 20,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                dotColor: const Color(0xFFD7D7D7),
                activeDotColor: kMainColor,
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.defaultSize! * 12,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Our goal is to ensure that you have everything you need to feel comfortable, confident, and ready to make an impact.",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: StylesData.font12,
              ),
            ),
          ),
          defaultButton(
            c: kMainColor,
            height: 63,
            fun: () {
              if (islast) {
                CacheHelper.saveData(key: 'onBoarding', value: true)
                    .then((value) {
                  Nav(context, const LoginView());
                });
              } else {
                pageController.nextPage(
                    duration: const Duration(seconds: 1), curve: Curves.easeIn);
              }
            },
            textWidget: Center(
              child: Text(
                islast ? "Sign In" : "Continue",
                style: StylesData.font14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
