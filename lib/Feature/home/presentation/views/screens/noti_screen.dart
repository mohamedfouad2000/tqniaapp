import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/notification_repo/notification_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/notification_screen_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationCubit(NotificationRepoImp())..getNotification(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              print("object");
              await NotificationCubit.get(context).MakeNotificationRead(id: 0);
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kbackColor,
                foregroundColor: kbackColor,
                centerTitle: true,
                title: Text(
                  "Notifications",
                  style: StylesData.font18.copyWith(color: Colors.black),
                ),
                leading: IconButton(
                  onPressed: () {
                    NotificationCubit.get(context)
                        .MakeNotificationRead(id: 0)
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              body: const NotificationScreenBody(),
            ),
          );
        },
      ),
    );
  }
}
