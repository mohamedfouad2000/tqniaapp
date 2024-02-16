import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/local/cache_Helper.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';
import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';
import 'package:tqniaapp/Feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:tqniaapp/Feature/splach/presentation/views/widgets/splach_view_body.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () async {
      bool onBordingCross =
          await CacheHelper.getData(key: 'onBoarding') ?? false;
      TOKEN = CacheHelper.getData(key: 'token') ?? '';
      USERID = CacheHelper.getData(key: 'userId') ?? '';

      if (TOKEN != '' && USERID != '') {
        print(TOKEN);
        print(USERID);
        Nav(context, const HomeView());
      } else {
        onBordingCross
            ? Nav(context, const LoginView())
            : Nav(context, const OnBoardingView());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplachViewBody(),
    );
  }
}
