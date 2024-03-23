import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo_imp.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Leads%20Info/leads_info_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Leads%20Info/leads_info_state.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/add_meeting_lead_form.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/calles_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/edit_lead_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/lead_info_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/meeting_lead_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/notes_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/tickets_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/add_calls_form.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/add_notes_form.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/add_tickets_form.dart';
import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';

class LeedsDetiles extends StatefulWidget {
  const LeedsDetiles({super.key, required this.id});
  final int id;

  @override
  State<LeedsDetiles> createState() => _LeedsDetilesState();
}

class _LeedsDetilesState extends State<LeedsDetiles>
    with TickerProviderStateMixin {
  TabController? tabCont;
  int index = 0;
  @override
  void dispose() {
    super.dispose();
    tabCont!.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabCont = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "Lead Details",
          style: StylesData.font18.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Nav(context, const HomeView());
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          if (tabCont!.index == 0)
            BlocProvider(
              create: (context) => LeadsInfoCubit(HomeRepoImp()),
              child: BlocConsumer<LeadsInfoCubit, LeadsInfoState>(
                builder: (context, state) {
                  return PopupMenuButton(
                    color: Colors.white,
                    elevation: 5.0,
                    enabled: true,
                    surfaceTintColor: Colors.white,
                    constraints:
                        const BoxConstraints.expand(width: 60.14, height: 75),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          padding: EdgeInsets.zero,
                          onTap: () {
                            NavegatorPush(context,
                                EditLeadScreen(editModel: editModel ?? Lead()));
                          },
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 29,
                                  backgroundColor:
                                      const Color(0xFF040415).withOpacity(0.10),
                                ),
                                const CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(AssetsData.edit2),
                                      width: 30.08,
                                      height: 30.08,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                    padding: EdgeInsets.zero,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 29,
                          backgroundColor:
                              const Color(0xFF040415).withOpacity(0.10),
                        ),
                        const CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Icon(
                              Icons.more_vert,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                listener: (BuildContext context, LeadsInfoState state) {
                  if (state is deleteLeadSucc) {
                    Fluttertoast.showToast(
                        msg: 'Deleted Succ',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 18.0);
                    Nav(context, const HomeView());
                  } else if (state is deleteLeadfalilure) {
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
              ),
            ),
          if (tabCont!.index == 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    barrierColor: Colors.black
                        .withOpacity(0.4000000059604645)
                        .withOpacity(0.3),
                    builder: (context) => BlocProvider(
                      create: (context) => AddticketCubit(AddTicketRepoImpl())
                        ..checkAddTicketPermission(),
                      child: BlocConsumer<AddticketCubit, AddticketState>(
                        listener: (context, state) {
                          if (state is CheckPermisionFailuire) {
                            if (state.errorMsq == 'forbidden please login') {
                              Nav(context, const LoginView());
                            }
                          }
                        },
                        builder: (context, state) {
                          if (state is CheckPermisionSucc) {
                            return Container(
                                color: Colors.white,
                                height: SizeConfig.screenHeight!,
                                child: const SingleChildScrollView(
                                    child: AddTiketsForm()));
                          } else if (state is CheckPermisionFailuire) {
                            return Center(
                              child: Text(state.errorMsq.toString()),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  );
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
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 24,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (tabCont!.index == 2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    barrierColor: Colors.black
                        .withOpacity(0.4000000059604645)
                        .withOpacity(0.3),
                    builder: (context) => Container(
                        color: Colors.white,
                        height: SizeConfig.screenHeight!,
                        child:
                            const SingleChildScrollView(child: AddNotesForm())),
                  ).whenComplete(() {
                    print("object");
                  });
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
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 24,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (tabCont!.index == 3)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    barrierColor: Colors.black
                        .withOpacity(0.4000000059604645)
                        .withOpacity(0.3),
                    builder: (context) => Container(
                        color: Colors.white,
                        height: SizeConfig.screenHeight!,
                        child:
                            const SingleChildScrollView(child: AddCallsForm())),
                  );
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
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 24,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (tabCont!.index == 4)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    useSafeArea: true,
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    )),
                    // backgroundColor: Colors.transparent,
                    barrierColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    builder: (context) => Container(
                        color: Colors.white,
                        child: const SingleChildScrollView(
                            child: AddMeetingLeadForm())),
                  );
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
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 24,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
        child: Column(
          children: [
            Container(
              // height: 42.02,
              decoration: ShapeDecoration(
                color: const Color(0xffEAE1E3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.69),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 8.85,
                    offset: Offset(0, 1.11),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TabBar(
                  onTap: (i) {
                    if (tabCont!.indexIsChanging) {
                      tabCont!.index = i;
                      setState(() {});
                    } else {
                      return;
                    }
                  },
                  controller: tabCont,
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  splashBorderRadius:
                      const BorderRadius.all(Radius.circular(10)),
                  labelColor: kMainColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.27),
                    color: Colors.white,
                    border: const Border(
                      bottom: BorderSide(
                        color: Colors.white, // Set the color of the line
                        width: 2.0, // Set the width of the line
                      ),
                    ),
                  ),
                  tabs: [
                    tabItem(txt: 'Lead Info'),
                    tabItem(txt: 'Tickets'),
                    tabItem(txt: 'Notes'),
                    tabItem(txt: 'Calls'),
                    tabItem(txt: 'Meeting'),
                  ]),
            ),
            Expanded(
                child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabCont,
              children: [
                LeadInfoScreen(id: widget.id),
                const TicketsScreen(),
                const NotesScreen(),
                const CallesScreen(),
                const MettingLeadScreen(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Tab tabItem({required String txt}) {
    return Tab(
      child: Container(
        width: 164.78,
        height: 42.02,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.27),
          ),
          shadows: const [],
        ),
        child: Center(
            child: Text(
          txt.toString(),
        )),
      ),
    );
  }
}
