import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});
//

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * .4,
      width: double.infinity,
      child: Center(
        child: Lottie.asset(
          'assets/images/error.json',
        ),
      ),
    );
  }
}
