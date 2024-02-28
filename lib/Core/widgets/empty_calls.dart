import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCallsWidget extends StatelessWidget {
  const EmptyCallsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No Calls"),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: Center(
            child: Lottie.asset(
              'assets/images/empty calls.json',
            ),
          ),
        ),
      ],
    );
  }
}
