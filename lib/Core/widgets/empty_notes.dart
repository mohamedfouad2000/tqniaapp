import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyNotesWidget extends StatelessWidget {
  const EmptyNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(""),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: Center(
            child: Lottie.asset(
              'assets/images/empty notes.json',
            ),
          ),
        ),
      ],
    );
  }
}
