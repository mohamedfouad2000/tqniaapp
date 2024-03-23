import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/custom_loading_widget.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Core/widgets/line_wid.dart';
import 'package:tqniaapp/Core/widgets/loading/metting_loading.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/edit_metting_screen.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/metting_card.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/share_with.dart';

class MettingFullCard extends StatefulWidget {
  const MettingFullCard({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  State<MettingFullCard> createState() => _MettingFullCardState();
}

class _MettingFullCardState extends State<MettingFullCard> {
  @override
  Widget build(BuildContext context) {
    // print(DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());
    return BlocProvider(
      create: (context) => MettingsCubit(MettingRepoImp())
        ..getMetting(
            start: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
            end: ''),
      child: BlocConsumer<MettingsCubit, MettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          
          if (state is GetMettingsSucc) {
            if (state.model.data!.meeting!.isEmpty) {
              return const MettingCard();
            }

            return Column(
              children: [
                SizedBox(
                  height: 150,
                  child: PageView(
                    controller: widget.pageController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...List.generate(
                        state.model.data!.meeting!.length,
                        (index) {
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
                                                image: state
                                                    .model
                                                    .data!
                                                    .meeting![index]
                                                    .createdByAvatar
                                                    .toString()),
                                            placeholder: (context, url) =>
                                                LoadingAnimationWidget
                                                    .newtonCradle(
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
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                            .model
                                                            .data!
                                                            .meeting![index]
                                                            .createdByName !=
                                                        null
                                                    ? "${item.createdByName}"
                                                    : '',
                                                style: StylesData.font10
                                                    .copyWith(
                                                        color: Colors.black),
                                              ),
                                              Text(
                                                state
                                                            .model
                                                            .data!
                                                            .meeting![index]
                                                            .startDate !=
                                                        null
                                                    ? state
                                                        .model
                                                        .data!
                                                        .meeting![index]
                                                        .startDate
                                                        .toString()
                                                    : '',
                                                style: StylesData.font8,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Flexible(
                                            flex: 2,
                                            child: ShareWithWidget(item: item)),
                                      ],
                                    ),
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
                                            FittedBox(
                                              child: Text('Edit',
                                                  style: StylesData.font7),
                                            ),
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
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SmoothPageIndicator(
                  controller: widget.pageController,
                  count: state.model.data!.meeting!.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 4.28,
                    dotWidth: 7.50,
                    dotColor: const Color(0xFFD7D7D7),
                    activeDotColor: kMainColor,
                  ),
                ),
              ],
            );
          } else if (state is GetMettingsfail) {
            return const FailureWidget();
          } else {
            return const CustomLoadingWidget(child: FullMettingScreen());
          }
        },
      ),
    );
  }
}
