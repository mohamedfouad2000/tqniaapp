import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyTicketsWidget extends StatelessWidget {
  const EmptyTicketsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Empty Ticket"),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: Center(
            child: Lottie.asset(
              'assets/images/empty tickets.json',
            ),
          ),
        ),
      ],
    );
  }
}
