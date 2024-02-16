import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

class CompanyTitleWidget extends StatelessWidget {
  const CompanyTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x11EA5A5A),
            blurRadius: 62.86,
            offset: Offset(14.61, 18.65),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(AssetsData.logo2),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tqnia-IT",
                style:
                    StylesData.font16.copyWith(color: const Color(0xFF040415)),
              ),
              Text(
                "Tqniait.com",
                style:
                    StylesData.font12.copyWith(color: const Color(0xFF7E7E7E)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
