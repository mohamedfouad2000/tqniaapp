import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/metting_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/line_wid.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/edit_metting_screen.dart';

class MeetingSearchScreen extends StatefulWidget {
  const MeetingSearchScreen(
      {super.key, required this.start, required this.end});
  final String start;
  final String end;
  @override
  State<MeetingSearchScreen> createState() => _MeetingSearchScreenState();
}

class _MeetingSearchScreenState extends State<MeetingSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        title: Text("Mettings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => MettingsCubit(MettingRepoImp())
            ..getMetting(start: widget.start, end: widget.end),
          child: BlocConsumer<MettingsCubit, MettingsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is GetMettingsSucc) {
                if (state.model.data!.meeting!.isEmpty) {
                  return MettingCard();
                }
                print(state.model.data!.meeting!.length);
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final item = state.model.data!.meeting![index];
                      return Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 160,
                            padding: const EdgeInsetsDirectional.only(
                                start: 32, end: 32, top: 20, bottom: 20),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.49, color: Color(0xFFF4F4F4)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x11EA5A5A),
                                  blurRadius: 62.86,
                                  offset: Offset(14.61, 18.65),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${item.title}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: StylesData.font16
                                      .copyWith(color: Colors.black),
                                ),
                                Expanded(
                                  child: Text(
                                    item.description != null
                                        ? "${item.description}"
                                        : '',
                                    style: StylesData.font8,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const LineWidget(),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(1000000),
                                      child: CachedNetworkImage(
                                        height: 24,
                                        width: 24,
                                        imageUrl: showImageFun(
                                            image: state.model.data!
                                                .meeting![index].createdByAvatar
                                                .toString()),
                                        placeholder: (context, url) =>
                                            LoadingAnimationWidget.newtonCradle(
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                        errorWidget: (context, url, er) =>
                                            Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.6,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.model.data!.meeting![index]
                                                      .createdByName !=
                                                  null
                                              ? "${item.createdByName}"
                                              : '',
                                          style: StylesData.font10
                                              .copyWith(color: Colors.black),
                                        ),
                                        Text(
                                          state.model.data!.meeting![index]
                                                      .startDate !=
                                                  null
                                              ? state.model.data!
                                                  .meeting![index].startDate
                                                  .toString()
                                              : '',
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
                                      '+1',
                                      style: StylesData.font8,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Container(
                              width: 8,
                              height: 137,
                              decoration: ShapeDecoration(
                                color: colorHex(state
                                    .model.data!.meeting![index].color
                                    .toString()),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          if (item.createdBy == USERID)
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                child: InkWell(
                                  onTap: () {
                                    NavegatorPush(
                                        context,
                                        EditMettingScreen(
                                          model: item,
                                        ));
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 19.66,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7.66, vertical: 3.83),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.48,
                                            color: Color(0xFFE92929)),
                                        borderRadius:
                                            BorderRadius.circular(15.32),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text('Edit', style: StylesData.font7),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        ImageIcon(
                                          const AssetImage(
                                            AssetsData.edit,
                                          ),
                                          size: 11,
                                          color: kMainColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: state.model.data!.meeting!.length);
              } else if (state is GetMettingsfail) {
                return FailureWidget();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget meetingItem({required Meeting model}) => Stack(
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
                      Text(model.title.toString()),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              model.companyName ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          const Text('•'),
                          const SizedBox(
                            width: 11,
                          ),
                          Text(int.parse(model.endTime!.substring(0, 2)) -
                                      int.parse(
                                          model.startTime!.substring(0, 2)) ==
                                  0
                              ? '${int.parse(model.endTime!.substring(0, 2)) - int.parse(model.startTime!.substring(0, 2))} hour'
                              : ''),
                        ],
                      )
                    ],
                  ),
                ), //12-15-10
              ),
            ],
          ),
        ),
        // if (model.isNow)
        // Padding(
        //   padding: const EdgeInsets.only(left: 45),
        //   child: Row(
        //     children: [
        //       const CircleAvatar(
        //         radius: 4.7,
        //         backgroundColor: Color(0xFF292932),
        //       ),
        //       Expanded(
        //         child: Container(
        //           height: 2.3,
        //           // width: double.infinity,
        //           color: const Color(0xFF292932),
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
