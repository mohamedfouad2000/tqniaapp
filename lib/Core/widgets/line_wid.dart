import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFEAEAEA),
          ),
        ),
      ),
    );
  }
}
