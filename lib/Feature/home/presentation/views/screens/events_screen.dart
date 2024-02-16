import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/calander_model.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/show_calander_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/calander_widget.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/month_widget.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

String dn = DateFormat('dd').format(DateTime.now());
String dt = DateFormat('EEEE').format(DateTime.now());

// List<MeetingModel> meeting = [
//   const MeetingModel(
//     title: 'Afyaa Alshmal Meeting',
//     subTitle: 'Profile',
//     time: '10 Am',
//     timetaken: 1,
//     color: Color(0xFFF9D9D9),
//     isNow: true,
//   ),
//   const MeetingModel(
//       title: 'Adwaa Alkhalil Meeting',
//       subTitle: 'Profile',
//       time: '11 Am',
//       isNow: false,
//       timetaken: 1,
//       color: Color(0xFFF9D9D9)),
//   const MeetingModel(
//     title: 'Tortor imperdiet pharetra.',
//     isNow: false,
//     subTitle: '',
//     time: '12 Am',
//     timetaken: null,
//     color: Color(0xFFE3DDFD),
//   ),
//   const MeetingModel(
//     title: 'Afyaa Alshmal Meeting',
//     isNow: false,
//     subTitle: 'Profile',
//     time: '1 Pm',
//     timetaken: 1,
//     color: Color(0xFFF9D9D9),
//   ),
//   const MeetingModel(
//       title: 'Adwaa Alkhalil Meeting',
//       isNow: false,
//       subTitle: 'Profile',
//       time: '2 pm',
//       timetaken: 1,
//       color: Color(0xFFF9D9D9)),
//   const MeetingModel(
//     title: 'Tortor imperdiet pharetra.',
//     isNow: false,
//     subTitle: '',
//     time: '3 pm',
//     timetaken: null,
//     color: Color(0xFFE3DDFD),
//   ),
// ];

int currentday = 0;
List<String> dayesNames = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class _EventsScreenState extends State<EventsScreen> {
  List<CalanderModel>? days;

  @override
  void initState() {
    for (var i = 0; i < dayesNames.length; i++) {
      if (dt == dayesNames[i]) {
        currentday = i;
        break;
      }
    }
    days = [
      CalanderModel(
          daytxt: dayesNames[
              currentday - 3 < 0 ? ((currentday - 3) + 7) : currentday - 3][0],
          dayNum: int.parse(dn.toString()) - 3,
          isselect: false),
      CalanderModel(
          daytxt: dayesNames[
              currentday - 2 < 0 ? ((currentday - 2) + 7) : currentday - 2][0],
          dayNum: int.parse(dn.toString()) - 2,
          isselect: false),
      CalanderModel(
          daytxt: dayesNames[
              currentday - 1 < 0 ? ((currentday - 1) + 7) : currentday - 1][0],
          dayNum: int.parse(dn.toString()) - 1,
          isselect: false),
      CalanderModel(
          daytxt: dayesNames[currentday][0],
          dayNum: int.parse(dn.toString()),
          isselect: true),
      CalanderModel(
          daytxt: dayesNames[(currentday + 1 > 6
              ? ((currentday + 1) - 7)
              : currentday + 1)][0],
          dayNum: int.parse(dn.toString()) + 1,
          isselect: false),
      CalanderModel(
          daytxt: dayesNames[
              currentday + 2 > 6 ? ((currentday + 2) - 7) : currentday + 2][0],
          dayNum: int.parse(dn.toString()) + 2,
          isselect: false),
      CalanderModel(
          daytxt: dayesNames[
              currentday + 3 > 6 ? ((currentday + 3) - 7) : currentday + 3][0],
          dayNum: int.parse(dn.toString()) + 3,
          isselect: false),
    ];

    /// TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 16.0, left: 16, right: 16, bottom: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const MonthWidget(),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () async {
                    NavegatorPush(context, TableMultiExample());
                  },
                  child: SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CalanderWidget(
                          model: days![index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: days!.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList.separated(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return mettingItem();

              // return txt(model: meeting[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15,
              );
            },
          )
        ],
      ),
    );
  }

  Widget mettingItem() => Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage(AssetsData.test),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.28),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Dell Hardware | 2024',
              style: StylesData.font16.copyWith(color: const Color(0xFF292932)),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(
                  width: 5.6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed Yasser",
                      style: StylesData.font10.copyWith(color: Colors.black),
                    ),
                    Text(
                      "Jan 23, 2024 | 10:00",
                      style: StylesData.font8,
                    ),
                  ],
                ),
                const Spacer(),
                const Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                    ),
                    Positioned(
                      left: 12,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    Positioned(
                      left: 24,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.brown,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  '+32',
                  style: StylesData.font8,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10.44,
                      left: 18.57,
                      right: 18.57,
                      bottom: 9.28,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0x19E92929),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage(
                            AssetsData.star,
                          ),
                          size: 20,
                          color: kMainColor,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text('Interested',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              color: Color(0xFFE92929),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10.44,
                      left: 18.57,
                      right: 18.57,
                      bottom: 9.28,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE92929),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.28),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Join to event',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
