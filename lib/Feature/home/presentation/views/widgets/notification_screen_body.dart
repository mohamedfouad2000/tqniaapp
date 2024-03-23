import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
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
          Nav(context, const HomeView());
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
          Nav(context, const HomeView());
          Fluttertoast.showToast(
              msg: state.errormsq.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 18.0);
        }
        if (state is SetLocationSucc) {
          Fluttertoast.showToast(
              msg: state.txt.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 18.0);
          Nav(context, const HomeView());
        }
        if (state is SetLocationeroor) {
          Fluttertoast.showToast(
              msg: state.errormsq.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 18.0);
          Nav(context, const HomeView());
        }
      },
      builder: (context, state) {
        if (state is getNotificatSucc) {
          if (state.model.data!.notifications!.isEmpty) {
            return const Center(
              child: Text("Notification Empty"),
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
                              "Make all as read",
                              style: StylesData.font12
                                  .copyWith(color: const Color(0xFFA29EB6)),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                      child: CustomScrollView(
                    slivers: [
                      SliverList.separated(
                          itemBuilder: (context, index) {
                            return Slidable(
                                key: ValueKey(
                                  int.parse(state
                                      .model.data!.notifications![index].id!),
                                ),
                                child: TaskName(
                                  id: state.model.data!.notifications![index].id
                                      .toString(),
                                  title: state
                                      .model.data!.notifications![index].title
                                      .toString(),
                                  body: state
                                      .model.data!.notifications![index].body
                                      .toString(),
                                  modelId: state
                                      .model.data!.notifications![index].modelId
                                      .toString(),
                                  modelType: state.model.data!
                                      .notifications![index].modelType
                                      .toString(),
                                  userId: state
                                      .model.data!.notifications![index].userId
                                      .toString(),
                                  isRead: state
                                      .model.data!.notifications![index].isRead
                                      .toString(),
                                  createdAt: state.model.data!
                                      .notifications![index].createdAt
                                      .toString(),
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: state.model.data!.notifications!.length),
                    ],
                  )),
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
