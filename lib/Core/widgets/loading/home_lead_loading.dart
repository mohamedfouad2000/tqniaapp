import 'package:flutter/material.dart';

class HomeLeadLoading extends StatelessWidget {
  const HomeLeadLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 197,
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.43, color: Color(0xFFF4F4F4)),
          borderRadius: BorderRadius.circular(19.15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x11EA5A5A),
            blurRadius: 54.93,
            offset: Offset(12.76, 16.30),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  height: 12,
                  width: 100,
                ),
              ),
              Container(
                color: Colors.grey[200],
                height: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.05, vertical: 4.19),
                decoration: ShapeDecoration(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.12),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.05, vertical: 4.19),
                decoration: ShapeDecoration(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.84, color: Color(0xFFEAEAEA)),
                    borderRadius: BorderRadius.circular(25.12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.grey[200],
            height: 20,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Container(
                color: Colors.grey[200],
                height: 24,
              ),
              const SizedBox(
                width: 5.6,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey[200],
                      height: 20,
                    ),
                    Container(
                      color: Colors.grey[200],
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                // width: 145.70,
                height: 26.63,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.35, vertical: 4.31),
                decoration: ShapeDecoration(
                  color: const Color(0x190CBC87),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.88),
                  ),
                ),
                child: Center(
                  child: Container(
                    color: Colors.grey[200],
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
