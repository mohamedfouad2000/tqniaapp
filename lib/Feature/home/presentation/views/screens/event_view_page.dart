import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/line_wid.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/edit_metting_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/share_with.dart';

class EventView extends StatefulWidget {
  const EventView({super.key, required this.model});
  final Meeting? model;

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
      ),
      body: Builder(builder: (context) {
        if (widget.model != null) {
          return Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsetsDirectional.only(
                    start: 32, end: 32, top: 20, bottom: 20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.49, color: Color(0xFFF4F4F4)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x11EA5A5A),
                      blurRadius: 62.86,
                      offset: Offset(14.61, 18.65),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.model?.title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: StylesData.font16.copyWith(color: Colors.black),
                    ),
                    Expanded(
                      child: Text(
                        widget.model?.description != null
                            ? "${widget.model?.description}"
                            : '',
                        style: StylesData.font8,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const LineWidget(),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000000),
                          child: CachedNetworkImage(
                            height: 24,
                            width: 24,
                            imageUrl: showImageFun(
                                image:
                                    widget.model!.createdByAvatar.toString()),
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
                                widget.model?.createdByName != null
                                    ? "${widget.model?.createdByName}"
                                    : '',
                                style: StylesData.font10
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                widget.model?.startDate != null
                                    ? widget.model!.startDate.toString()
                                    : '',
                                style: StylesData.font8,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Flexible(
                            flex: 2,
                            child: ShareWithWidget(item: widget.model!)),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Container(
                  width: 8,
                  height: 137,
                  decoration: ShapeDecoration(
                    color: colorHex(widget.model!.color.toString()),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              if (widget.model?.createdBy == USERID)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: InkWell(
                      onTap: () {
                        NavegatorPush(
                            context,
                            EditMettingScreen(
                              model: widget.model!,
                            ));
                      },
                      child: Container(
                        width: 50,
                        height: 19.66,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7.66, vertical: 3.83),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.48, color: Color(0xFFE92929)),
                            borderRadius: BorderRadius.circular(15.32),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text('Edit', style: StylesData.font7),
                            const SizedBox(
                              width: 3,
                            ),
                            ImageIcon(
                              const AssetImage(
                                AssetsData.edit,
                              ),
                              size: 11,
                              color: kMainColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        } else {
          return const Center(
            child: Text("Empty"),
          );
        }
      }),
    );
  }
}
