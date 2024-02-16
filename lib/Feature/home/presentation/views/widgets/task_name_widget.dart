import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Feature/home/data/model/notification_model/notification.dart';

class TaskName extends StatefulWidget {
  const TaskName({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.istask,
    required this.isread,
    required this.date,
    required this.projectTitle,
    required this.taskId,
    required this.model,
  });
  final String image;
  final String title;
  final String subTitle;
  final bool istask;
  final int isread;
  final String date;
  final String projectTitle;
  final String taskId;
  final Notifications model;

  @override
  State<TaskName> createState() => _TaskNameState();
}

class _TaskNameState extends State<TaskName> {
  String? newImage;
  @override
  void initState() {
    newImage = showImageFun(image: widget.image);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            decoration: ShapeDecoration(
              color: widget.isread == 0 ? Colors.grey[300] : Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.46, color: Color(0xFFF4F4F4)),
                borderRadius: BorderRadius.circular(20.59),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.istask)
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: kMainColor,
                    child: Center(
                      child: ImageIcon(
                        AssetImage(
                          // ,
                          widget.image,
                        ),
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (!widget.istask)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000000),
                    child: CachedNetworkImage(
                      height: 46,
                      imageUrl: '$newImage',
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
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.title != null)
                        Text(
                          widget.title,
                          style:
                              StylesData.font14.copyWith(color: Colors.black),
                        ),
                      if (widget.subTitle != 'null')
                        Text(
                          widget.subTitle,
                          style: StylesData.font8,
                        ),
                      if (widget.model.event != null)
                        Text(
                          'event: ${widget.model.event.toString()}',
                          style: StylesData.font8,
                        ),
                      if (widget.model.taskId != null)
                        Text(
                          'taskId: ${widget.model.taskId.toString()}',
                          style: StylesData.font8,
                        ),
                      if (widget.model.taskTitle != null)
                        Text(
                          'taskTitle: ${widget.model.taskTitle.toString()}',
                          style: StylesData.font8,
                        ),
                      if (widget.model.activityLogChanges != null)
                        Text(
                          'activity: ${widget.model.activityLogChanges.toString()}',
                          style: StylesData.font8,
                        ),
                      if (widget.model.projectTitle != null)
                        Text(
                          'Title: ${widget.model.projectTitle.toString()}',
                          style: StylesData.font8,
                        ),
                      if (widget.model.activityLogType != null)
                        Text(
                          'Type: ${widget.model.activityLogType.toString()}',
                          style: StylesData.font8,
                        ),
                      if (widget.model.activityLogId != null)
                        Text(
                          'id: ${widget.model.activityLogId.toString()}',
                          style: StylesData.font8,
                        ),
                    ],
                  ),
                ),
                if (widget.isread == 1)
                  Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFE92929),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, right: 7),
            child: Text(
              // ,
              widget.date,
              style: StylesData.font8,
            ),
          )
        ],
      ),
    );
  }
}
