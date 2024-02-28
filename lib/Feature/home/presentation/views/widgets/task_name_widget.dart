import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/event_view_page.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/ticket_info_screen.dart';

class TaskName extends StatefulWidget {
  const TaskName({
    super.key,
    required this.id,
    required this.title,
    required this.body,
    required this.modelId,
    required this.modelType,
    required this.userId,
    required this.isRead,
    required this.createdAt,
  });
  final String id;
  final String title;
  final String body;
  final String modelId;
  final String modelType;
  final String userId;
  final String isRead;
  final String createdAt;

  @override
  State<TaskName> createState() => _TaskNameState();
}

class _TaskNameState extends State<TaskName> {
  String? newImage;
  @override
  void initState() {
    // newImage = showImageFun(image: widget.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (widget.modelType == 'meeting') {
              NavegatorPush(
                  context, EventView(id: int.parse(widget.modelId.toString())));
            } else if (widget.modelType == 'ticket') {
              NavegatorPush(context,
                  TicketInfoScreen(id: int.parse(widget.modelId.toString())));
            } else {}
                NotificationCubit.get(context)
                .MakeNotificationRead(id: int.parse(widget.id.toString()));
        
              
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.46, color: Color(0xFFF4F4F4)),
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
                    // if (false)
                    //   CircleAvatar(
                    //     radius: 23,
                    //     backgroundColor: kMainColor,
                    //     child: Center(
                    //       child: ImageIcon(
                    //         AssetImage(
                    //           // ,
                    //           widget.image,
                    //         ),
                    //         size: 24,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),

                    // if (!widget.istask)
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(1000000),
                    //   child: CachedNetworkImage(
                    //     height: 46,
                    //     imageUrl: '$newImage',
                    //     placeholder: (context, url) =>
                    //         LoadingAnimationWidget.newtonCradle(
                    //       size: 50,
                    //       color: Colors.grey,
                    //     ),
                    //     errorWidget: (context, url, er) => Container(
                    //       decoration: const BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style:
                                StylesData.font14.copyWith(color: Colors.black),
                          ),
                          if (widget.body != 'null')
                            Text(
                              widget.body,
                              style: StylesData.font8,
                            ),
                        ],
                      ),
                    ),
                    if (int.parse(widget.isRead) == 0)
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
                  widget.createdAt,
                  style: StylesData.font8,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
