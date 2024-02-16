import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/user%20data/user_data_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/leeds_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/main_home_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/meettings_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/profile_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentindex = 0;
  List<Widget> Screens = [
    const MainHomeScreen(),
    const LeedsScreen(),
    const MeetingsScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    print(TOKEN);
    return BlocProvider(
      create: (context) => UserDataCubit(HomeRepoImp())..getUserData(),
      child: Scaffold(
        bottomNavigationBar: Container(
          // height: 100.08,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.93),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (v) {
              setState(() {
                currentindex = v;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: currentindex == 0
                      ? Column(
                          children: [
                            Text(
                              'Home',
                              style: StylesData.font16,
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 2.5,
                            )
                          ],
                        )
                      : const ImageIcon(
                          AssetImage(
                            AssetsData.home,
                          ),
                          size: 27,
                          color: Colors.black,
                        ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: currentindex == 1
                      ? Column(
                          children: [
                            Text(
                              'Leads',
                              style: StylesData.font16,
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 2.5,
                            )
                          ],
                        )
                      : const ImageIcon(
                          AssetImage(
                            AssetsData.activity,
                          ),
                          size: 27,
                          color: Colors.black,
                        ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: currentindex == 2
                      ? Column(
                          children: [
                            Text(
                              'Meetings',
                              style: StylesData.font16,
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 2.5,
                            )
                          ],
                        )
                      : const ImageIcon(
                          AssetImage(
                            AssetsData.calendar,
                          ),
                          size: 27,
                          color: Colors.black,
                        ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: currentindex == 3
                      ? Column(
                          children: [
                            Text(
                              'Profile',
                              style: StylesData.font16,
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 2.5,
                            )
                          ],
                        )
                      : const ImageIcon(
                          AssetImage(
                            AssetsData.profile,
                          ),
                          size: 27,
                          color: Colors.black,
                        ),
                  label: ''),
            ],
            backgroundColor: kbackColor,
          ),
        ),
        body: SafeArea(child: Screens[currentindex]),
      ),
    );
  }
}
