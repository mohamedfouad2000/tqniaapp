import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';

import 'package:tqniaapp/Feature/home/presentation/views/widgets/lead_name_widget.dart';

class LeedFullWidget extends StatelessWidget {
  const LeedFullWidget({
    super.key,
    required this.model,
  });
  final Lead model;

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
          LeadNameWidget(
            name: model.companyName ?? '',
            state: model.leadStatusTitle ?? '',
            createddate: model.createdDate ?? '',
            lastupdate: model.lastUpdate ?? '',
            color: model.leadStatusColor ?? '',
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
                  color: const Color(0xFF828282),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.12),
                  ),
                ),
                child: Center(
                  child: Text(model.city ?? '',
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10.05,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.05, vertical: 4.19),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.84, color: Color(0xFFEAEAEA)),
                    borderRadius: BorderRadius.circular(25.12),
                  ),
                ),
                child: Center(
                  child: Text(model.state ?? '',
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          color: colorHex(model.leadStatusColor ?? ''),
                          fontSize: 10.05,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: SizeConfig.screenWidth! * .77,
            child: Text(
              '${model.currency}',
              style: StylesData.font8,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000000),
                child: CachedNetworkImage(
                  height: 24,
                  imageUrl: showImageFun(image: model.ownerAvatar.toString()),
                  placeholder: (context, url) =>
                      LoadingAnimationWidget.newtonCradle(
                    size: 50,
                    color: Colors.grey,
                  ),
                  errorWidget: (context, url, er) => Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.6,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.ownerName ?? '',
                      style: StylesData.font10.copyWith(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      model.phone ?? '',
                      style: StylesData.font8,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                  child: Text(
                    "Followed up and updated",
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        color: Color(0xFF0CBC87),
                        fontSize: 10.05,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
