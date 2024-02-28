import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/notification_repo/notification_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_state.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/user%20data/user_data_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/user%20data/user_data_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/noti_screen.dart';

class CustomMainHomePageAppBar extends StatelessWidget {
  const CustomMainHomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var x = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSucc) {
          String profImge = state.model.data!.user!.image.toString();

          return Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000000),
                    child: CachedNetworkImage(
                      height: 46,
                      width: 46,
                      imageUrl: profImge != 'null'
                          ? 'https://system.tqnia.me/$profImge'
                          : 'https://system.tqnia.me/assets/images/avatar.jpg',
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
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 22,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello ${state.model.data?.user?.firstName}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: StylesData.font14
                          .copyWith(color: const Color(0xFF7E7E7E)),
                    ),
                    Text(
                      x.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: StylesData.font18,
                    ),
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => NotificationCubit(NotificationRepoImp())
                  ..getNotificationCount(),
                child: BlocConsumer<NotificationCubit, NotificationState>(
                  listener: (context, state) {
          
                  },
                  builder: (context, state) {
                    if (state is GetNotificationCountSucc) {
                      return InkWell(
                        onTap: () {
                          NavegatorPush(context, const NotificationScreen());
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 29,
                              backgroundColor:
                                  const Color(0xFF040415).withOpacity(0.10),
                            ),
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.white,
                              child: Center(
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    const ImageIcon(
                                        AssetImage(AssetsData.notification)),
                                    if (state.count != 0)
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor: kMainColor,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is GetNotificationCounteroor) {
                      return Container();
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          );
        } else if (state is GetUserDataFailure) {
          return const FailureWidget();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
