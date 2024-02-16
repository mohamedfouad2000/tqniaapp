import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/task_name_widget.dart';
import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';

class NotificationScreenBody extends StatefulWidget {
  const NotificationScreenBody({super.key});

  @override
  State<NotificationScreenBody> createState() => _NotificationScreenBodyState();
}

class _NotificationScreenBodyState extends State<NotificationScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state is getNotificatieroor) {
          if (state.errormsq == 'forbidden please login') {
            Nav(context, const LoginView());
          }
        } else if (state is MakeNotifAsReaderoor) {
          Fluttertoast.showToast(
              msg: state.errormsq.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 18.0);
        }
        if (state is DeleteNotificationByIdSucc) {
          Nav(context, HomeView());
          Fluttertoast.showToast(
              msg: state.txt.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 18.0);
        }
        if (state is DeleteNotificationByIderoor) {
          Nav(context, HomeView());
          Fluttertoast.showToast(
              msg: state.errormsq.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 18.0);
        }
      },
      builder: (context, state) {
        if (state is getNotificatSucc) {
          if (state.model.data!.notifications!.isEmpty) {
            return const Center(
              child: Text("Empty List"),
            );
          }
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          NotificationCubit.get(context)
                              .MakeNotificationRead(id: 0)
                              .then((value) {
                            Nav(context, const HomeView());
                          });
                        },
                        child: Row(
                          children: [
                            const ImageIcon(
                              AssetImage(
                                AssetsData.checkDone,
                              ),
                              size: 24,
                              color: Color(0xff1C1243),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Mask as read all",
                              style: StylesData.font12
                                  .copyWith(color: const Color(0xFFA29EB6)),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          NotificationCubit.get(context)
                              .deleteNotificationById(id: 0)
                              .then((value) {
                            Nav(context, HomeView());
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              "Delete all",
                              style:
                                  StylesData.font12.copyWith(color: kMainColor),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            ImageIcon(
                              const AssetImage(
                                AssetsData.delete,
                              ),
                              size: 24,
                              color: kMainColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Slidable(
                            key: ValueKey(int.parse(
                                state.model.data!.notifications![index].id!)),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  // width: 73.20,
                                  // height: 91.50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.30),
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
                                  child: const ImageIcon(
                                    AssetImage(AssetsData.share),
                                    size: 27,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    NotificationCubit.get(context)
                                        .deleteNotificationById(
                                            id: int.parse(state.model.data!
                                                .notifications![index].id!))
                                        .then((value) {});
                                  },
                                  child: Container(
                                    // width: 73.20,
                                    // height: 91.50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.30),
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
                                    child: ImageIcon(
                                      const AssetImage(AssetsData.delete),
                                      size: 27,
                                      color: kMainColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                            child: TaskName(
                              projectTitle: state.model.data!
                                  .notifications![index].projectTitle
                                  .toString(),
                              image: state
                                  .model.data!.notifications![index].userImage
                                  .toString(),
                              isread: int.parse(state
                                  .model.data!.notifications![index].isRead
                                  .toString()),
                              date: state
                                  .model.data!.notifications![index].createdAt
                                  .toString(),
                              istask: false,
                              title: state
                                  .model.data!.notifications![index].userName!
                                  .toString(),
                              subTitle: state
                                  .model.data!.notifications![index].event
                                  .toString(),
                              taskId: state
                                  .model.data!.notifications![index].taskId
                                  .toString(),
                              model: state.model.data!.notifications![index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: state.model.data!.notifications!.length),
                  ),
                ],
              ));
        } else if (state is getNotificatieroor) {
          return const FailureWidget();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
