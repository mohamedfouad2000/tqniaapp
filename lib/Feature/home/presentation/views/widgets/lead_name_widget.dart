import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

class LeadNameWidget extends StatelessWidget {
  const LeadNameWidget({
    super.key,
    required this.name,
    required this.createddate,
    required this.lastupdate,
    required this.color,
    required this.state,
  });
  final String name;
  final String createddate;
  final String color;
  final String lastupdate;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 23,
          backgroundColor: colorHex(color),
          child: const Center(
            child: ImageIcon(
              AssetImage(
                AssetsData.clipboard,
              ),
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StylesData.font14.copyWith(color: Colors.black),
              ),
              Text(
                '$lastupdate | $createddate',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StylesData.font8,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 10.35, vertical: 6.31),
          decoration: ShapeDecoration(
            color: colorHex(color),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.88),
            ),
          ),
          child: Text(
            state,
            style: StylesData.font10,
          ),
        ),
      ],
    );
  }
}
