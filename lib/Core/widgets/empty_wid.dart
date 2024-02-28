import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyMettingWidget extends StatelessWidget {
  const EmptyMettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("No Metting Today"),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: Center(
            child: Lottie.asset(
              'assets/images/empty Metting.json',
            ),
          ),
        ),
      ],
    );
  }
}
