import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/line_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/edit_metting_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/share_with.dart';

class EventView extends StatefulWidget {
  const EventView({super.key, required this.id});
  final int? id;

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  bool isConfirm = false;
  bool isReject = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meeting Details"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            MettingsCubit(MettingRepoImp())..getMettingbyId(id: widget.id!),
        child: BlocConsumer<MettingsCubit, MettingsState>(
          listener: (context, state) {
            if (state is SetMeetingStatusSucc) {
              Navigator.pop(context, () {
                setState(() {});
              });
            }
          },
          builder: (context, state) {
            if (state is GetMeetingByIdSucc) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
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
                            "${state.model.title}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                StylesData.font16.copyWith(color: Colors.black),
                          ),
                          Expanded(
                            child: Text(
                              state.model.description != null
                                  ? "${state.model.description}"
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
                                borderRadius: BorderRadius.circular(1000000),
                                child: CachedNetworkImage(
                                  height: 24,
                                  width: 24,
                                  imageUrl:
                                      '$showImageurl${state.model.createdByAvatar?.split('/').last.toString()}',
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
                                width: 5.6,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.model.createdByName != null
                                          ? "${state.model.createdByName}"
                                          : '',
                                      style: StylesData.font10
                                          .copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      state.model.startDate != null
                                          ? state.model.startDate.toString()
                                          : '',
                                      style: StylesData.font8,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Flexible(
                                  flex: 2,
                                  child: ShareWithWidget(item: state.model)),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          if (state.model.createdBy != USERID)
                            Builder(builder: (context) {
                              if (state is SetMeetingStatusLoading) {
                                return LinearProgressIndicator(
                                  color: kMainColor,
                                );
                              }

                              return Row(
                                children: [
                                  if (state.model.status != 'confirmed')
                                    Expanded(
                                      child: defaultButton(
                                          fun: () {
                                            MettingsCubit.get(context)
                                                .setMettingStatus(
                                                    id: widget.id!,
                                                    status: 'confirmed');
                                          },
                                          textWidget: const Text(
                                            "confirm",
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0),
                                          ),
                                          c: Colors.green,
                                          height: 36),
                                    ),
                                  if (state.model.status != 'confirmed')
                                    const SizedBox(
                                      width: 12,
                                    ),
                                  if (state.model.status != 'rejected')
                                    Expanded(
                                      child: defaultButton(
                                          fun: () {
                                            MettingsCubit.get(context)
                                                .setMettingStatus(
                                                    id: widget.id!,
                                                    status: 'rejected');
                                          },
                                          textWidget: const Text(
                                            "Reject",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0),
                                          ),
                                          c: kMainColor,
                                          height: 36),
                                    ),
                                  if (state.model.status != 'rejected')
                                    const SizedBox(
                                      width: 12,
                                    ),
                                  Expanded(
                                    child: defaultButton(
                                        height: 36,
                                        fun: () {
                                          Navigator.pop(context);
                                        },
                                        textWidget: const Text(
                                          "cancel",
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        c: Colors.white),
                                  ),
                                ],
                              );
                            }),
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
                          color: colorHex(state.model.color.toString()),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    if (state.model.createdBy == USERID)
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
                                    model: state.model,
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
                                      width: 0.48, color: Color(0xFFE92929)),
                                  borderRadius: BorderRadius.circular(15.32),
                                ),
                              ),
                              child: Row(
                                children: [
                                  FittedBox(
                                      child: Text('Edit',
                                          style: StylesData.font7)),
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
                ),
              );
            } else if (state is GetMeetingByIdfail) {
              return Center(
                child: Text(state.errormsq.toString()),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
