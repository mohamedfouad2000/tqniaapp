import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/meeting_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/metting_search_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/add_meeting_form.dart';

class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({super.key});

  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  Color meetingColor = const Color(0xFFE92929);
  Color meetingtxtColor = Colors.white;

  Color eventColor = const Color(0xFFF6F6F6);
  Color eventtxtColor = const Color(0xFF94949D);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomMeetingAppBar(),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(9.29),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.16, color: Color(0x4494949D)),
                  borderRadius: BorderRadius.circular(13.93),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              String? Startdate;
                              bool isEmpty = false;

                              String? enddate;
                              return AlertDialog(
                                surfaceTintColor: Colors.white,
                                title: Text(
                                  "Choose Date",
                                ),
                                content: StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Container(
                                    height: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor:
                                                  Color(0xFF0D223F),
                                              radius: 18,
                                              child: Center(
                                                  child: ImageIcon(
                                                AssetImage(
                                                  AssetsData.calendar,
                                                ),
                                                size: 20,
                                                color: Colors.white,
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(1950),
                                                        lastDate:
                                                            DateTime(2100));

                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(pickedDate);

                                                  setState(() {
                                                    Startdate = formattedDate;
                                                  });
                                                  print("object");
                                                } else {}
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Start Date",
                                                    style: StylesData.font12
                                                        .copyWith(
                                                      color: const Color(
                                                          0xFF0D223F),
                                                    ),
                                                  ),
                                                  Text(
                                                    Startdate ??
                                                        'Tab Here to add Date',
                                                    style: StylesData.font10
                                                        .copyWith(
                                                      color: const Color(
                                                          0xFFA29EB6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor:
                                                  Color(0xFFE92929),
                                              radius: 18,
                                              child: Center(
                                                  child: ImageIcon(
                                                AssetImage(
                                                  AssetsData.calendar,
                                                ),
                                                size: 20,
                                                color: Colors.white,
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(1950),
                                                        //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2100));

                                                if (pickedDate != null) {
                                                  print(
                                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                  String formattedDate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(pickedDate);
                                                  print(
                                                      formattedDate); //formatted date output using intl package =>  2021-03-16

                                                  //set output date to TextField value.
                                                  setState(() {
                                                    enddate = formattedDate;
                                                  });
                                                  print(enddate);
                                                  print("aha");
                                                } else {}
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "End Date",
                                                    style: StylesData.font12
                                                        .copyWith(
                                                      color: const Color(
                                                          0xFF0D223F),
                                                    ),
                                                  ),
                                                  Text(
                                                    enddate ??
                                                        'Tab Here to add Date',
                                                    style: StylesData.font10
                                                        .copyWith(
                                                      color: const Color(
                                                          0xFFA29EB6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        if (isEmpty)
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(078),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.info,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    'Enter Date',
                                                    style: StylesData.font14
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        if (isEmpty)
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        defaultButton(
                                            height: 40,
                                            fun: () {
                                              if (Startdate != null &&
                                                  enddate != null) {
                                                NavegatorPush(
                                                    context,
                                                    MeetingSearchScreen(
                                                        start: Startdate!,
                                                        end: enddate!));
                                              } else {
                                                setState(() {
                                                  isEmpty = true;
                                                });
                                              }
                                            },
                                            textWidget: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Search Meetings',
                                                  style: StylesData.font14
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward_rounded,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                            c: kMainColor)
                                      ],
                                    ),
                                  );
                                }),
                              );
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: ShapeDecoration(
                          color: meetingColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.93),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x26484067),
                              blurRadius: 37.14,
                              offset: Offset(0, 9.29),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              const AssetImage(
                                AssetsData.calendar,
                              ),
                              size: 20,
                              color: meetingtxtColor,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Meeting',
                              style: StylesData.font12
                                  .copyWith(color: meetingtxtColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  // Expanded(
                  //   child: InkWell(
                  //     onTap: () {
                  //       setState(() {

                  //         eventColor = const Color(0xFFE92929);
                  //         eventtxtColor = Colors.white;
                  //         meetingColor = const Color(0xFFF6F6F6);
                  //         meetingtxtColor = const Color(0xFF94949D);
                  //       });
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.symmetric(vertical: 10),
                  //       decoration: ShapeDecoration(
                  //         color: eventColor,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(13.93),
                  //         ),
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           ImageIcon(
                  //             const AssetImage(
                  //               AssetsData.Events,
                  //             ),
                  //             size: 20,
                  //             color: eventtxtColor,
                  //           ),
                  //           const SizedBox(
                  //             width: 4,
                  //           ),
                  //           Text(
                  //             'Events',
                  //             style: StylesData.font16.copyWith(
                  //               color: eventtxtColor,
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(child: MeetingScreen()),
          // if (!ismeeting) const Expanded(child: EventsScreen()),
        ],
      ),
    );
  }

  Row CustomMeetingAppBar() {
    return Row(
      children: [
        Text(
          "Meetings",
          style: StylesData.font18.copyWith(color: const Color(0xFF040415)),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              showDragHandle: true,
              builder: (context) {
                return const SingleChildScrollView(child: AddMeetingForm());
              },
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 29,
                backgroundColor: const Color(0xFF040415).withOpacity(0.10),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: kMainColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
