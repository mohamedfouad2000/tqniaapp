import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/empty_wid.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/model/calander_model.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/event_view_page.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/show_calander_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/calander_widget.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/metting_card.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/month_widget.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

String dn = DateFormat('dd').format(DateTime.now());
String dt = DateFormat('EEEE').format(DateTime.now());

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

class _MeetingScreenState extends State<MeetingScreen> {
  List<CalanderModel>? days;
  int x = 0;

  @override
  void initState() {
    print("object");
    print('dn is $dn');
    print('dt $dt');
    for (var i = 0; i < dayesNames.length; i++) {
      if (dt == dayesNames[i]) {
        currentday = i;
        break;
      }
    }
    days = [
      CalanderModel(
          daytxt: DateFormat('EEEE')
              .format(DateTime.now().add(const Duration(days: -3)))[0],
          dayNum: int.parse(DateFormat('dd')
              .format(DateTime.now().add(const Duration(days: -3)))),
          isselect: false),
      CalanderModel(
          daytxt: DateFormat('EEEE')
              .format(DateTime.now().add(const Duration(days: -2)))[0],
          dayNum: int.parse(DateFormat('dd')
              .format(DateTime.now().add(const Duration(days: -2)))),
          isselect: false),
      CalanderModel(
          daytxt: DateFormat('EEEE')
              .format(DateTime.now().add(const Duration(days: -1)))[0],
          dayNum: int.parse(DateFormat('dd')
              .format(DateTime.now().add(const Duration(days: -1)))),
          isselect: false),
      CalanderModel(
          daytxt: DateFormat('EEEE').format(DateTime.now())[0],
          dayNum: int.parse(DateFormat('dd').format(DateTime.now())),
          isselect: true),
      CalanderModel(
          daytxt: DateFormat('EEEE')
              .format(DateTime.now().add(const Duration(days: 1)))[0],
          dayNum: int.parse(DateFormat('dd')
              .format(DateTime.now().add(const Duration(days: 1)))),
          isselect: false),
      CalanderModel(
          daytxt: DateFormat('EEEE')
              .format(DateTime.now().add(const Duration(days: 2)))[0],
          dayNum: int.parse(DateFormat('dd')
              .format(DateTime.now().add(const Duration(days: 2)))),
          isselect: false),
      CalanderModel(
          daytxt: DateFormat('EEEE')
              .format(DateTime.now().add(const Duration(days: 3)))[0],
          dayNum: int.parse(DateFormat('dd')
              .format(DateTime.now().add(const Duration(days: 3)))),
          isselect: false),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(dt);
    return BlocProvider(
      create: (context) => MettingsCubit(MettingRepoImp())
        ..getMetting(
            start: DateFormat('yyyy-MM-dd')
                .format(DateTime.now().add(const Duration(days: -30)))
                .toString(),
            end: DateFormat('yyyy-MM-dd')
                .format(DateTime.now().add(const Duration(days: 30)))
                .toString(),
            isGetDataToday: true),
      child: BlocConsumer<MettingsCubit, MettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GetMettingsSucc) {
            if (state.model.data!.meeting!.isEmpty) {
              return const MettingCard();
            }

            return Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 16),
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
                            print("object");

                            NavegatorPush(context, const TableMultiExample());
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
                              separatorBuilder:
                                  (BuildContext context, int index) {
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
                  if (MettingsCubit.get(context).modelToday.isNotEmpty)
                    SliverList.separated(
                      itemCount: MettingsCubit.get(context).modelToday.length,
                      itemBuilder: (BuildContext context, int index) {
                        return meetingItem(
                            model: MettingsCubit.get(context).modelToday[index],
                            context: context);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  if (MettingsCubit.get(context).modelToday.isEmpty)
                    SliverList.separated(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return const EmptyMettingWidget();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                    ),
                ],
              ),
            );
          } else if (state is GetMettingsfail) {
            return const FailureWidget();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget meetingItem({required Meeting model, required context}) => Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.startTime.toString(),
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: StylesData.font16.copyWith(
                  color: const Color(0xFF94949D),
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    NavegatorPush(
                        context, EventView(id: int.parse(model.id.toString())));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: ShapeDecoration(
                      color: colorHex(model.color.toString()),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.51),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                model.companyName ?? '',
                                maxLines: 1,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            const Text(
                              '•',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            Text(int.parse(model.endTime!.substring(0, 2)) -
                                        int.parse(
                                            model.startTime!.substring(0, 2)) >=
                                    0
                                ? '${int.parse(model.endTime!.substring(0, 2)) - int.parse(model.startTime!.substring(0, 2))} hour'
                                : ''),
                          ],
                        )
                      ],
                    ),
                  ),
                ), //12-15-10
              ),
            ],
          ),
        ),
      ],
    );
