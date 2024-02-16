import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/user%20data/user_data_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/user%20data/user_data_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/edit_profile_body.dart';

class ProfileEditHeaderWidget extends StatelessWidget {
  const ProfileEditHeaderWidget({
    super.key,
  });
//
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSucc) {
          print(state.model.data!.user?.phone);
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000000),
                child: CachedNetworkImage(
                  height: 46,
                  imageUrl: '$showProfileImage${state.model.data!.user!.image}',
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
                width: 22,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${state.model.data?.user?.firstName} ${state.model.data?.user?.lastName}",
                      style: StylesData.font16
                          .copyWith(color: const Color(0xFF040415)),
                    ),
                    Text(
                      "${state.model.data?.user?.email}",
                      style: StylesData.font12
                          .copyWith(color: const Color(0xFF7E7E7E)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  NavegatorPush(
                      context,
                      EditProfileScreen(
                          name:
                              '${state.model.data!.user?.firstName} ${state.model.data!.user?.lastName} ',
                          email: state.model.data?.user?.email.toString() ?? '',
                          phone: state.model.data?.user?.phone.toString() ?? '',
                          image:
                              '$showProfileImage${state.model.data!.user!.image}'));
                },
                child: Container(
                  width: 94,
                  height: 40,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Edit',
                          style: StylesData.font16.copyWith(color: kMainColor)),
                      const SizedBox(
                        width: 3,
                      ),
                      ImageIcon(
                        const AssetImage(
                          AssetsData.edit,
                        ),
                        size: 24,
                        color: kMainColor,
                      )
                    ],
                  ),
                ),
              ),
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
