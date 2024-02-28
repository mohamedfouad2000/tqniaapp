import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/local/cache_Helper.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/company_title_widget.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/profile_custom_app_bar.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/profile_edit_header_widget.dart';
import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileAppBar(),
            const SizedBox(
              height: 40,
            ),
            const ProfileEditHeaderWidget(),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Company workspace',
              style: StylesData.font16.copyWith(
                color: const Color(0xFF040415),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const CompanyTitleWidget(),
            // const SizedBox(
            //   height: 24,
            // ),
            // Text(
            //   'Notification',
            //   style: StylesData.font16.copyWith(
            //     color: const Color(0xFF040415),
            //   ),
            // ),
            // const SizedBox(
            //   height: 16,
            // ),
            // const TurnOnWidget(txt: 'Turn on', Image: AssetsData.notification),
            // const SizedBox(
            //   height: 16,
            // ),
            // const TurnOnWidget(
            //     txt: 'Push notification', Image: AssetsData.push),
           
            const SizedBox(
              height: 16,
            ),
            logOutWidget(context),
          ],
        ),
      ),
    );
  }

  Widget logOutWidget(context) {
    return InkWell(
      onTap: () {
        CacheHelper.removeData(key: 'token').then((value) {
          CacheHelper.removeData(key: 'userId').then((value) {
            FirebaseMessaging.instance.unsubscribeFromTopic('client$USERID');
            TOKEN = '';
            USERID = '';
            Nav(context, const LoginView());
          });
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFFFFDEDE),
              child: Center(
                child: Image(
                  image: AssetImage(
                    AssetsData.logout,
                  ),
                  height: 24,
                  width: 24,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text('Logout',
                style: StylesData.font16.copyWith(
                  color: const Color(0xFFE92929),
                )),
          ],
        ),
      ),
    );
  }
}
