import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Feature/home/data/model/all_clients_model/datum.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/All%20Client/all_client_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/All%20Client/all_client_state.dart';

class ShareWithWidget extends StatefulWidget {
  const ShareWithWidget({super.key, required this.item});
  final Meeting item;

  @override
  State<ShareWithWidget> createState() => _ShareWithWidgetState();
}

class _ShareWithWidgetState extends State<ShareWithWidget> {
  Set<Datum>? list2 = {};
  Set<Datum>? list3 = {};

  List<String> sList = [];

  Future<void> getclient() async {
    String? x = widget.item.shareWith;
    if (x != null) {
      while (x != null) {
        String y = x.split(',').first;
        // print(y);
        // print(x);
        sList.add(y);
        if (x.isNotEmpty) {
          x = x.substring(y.length + 1, x.length);
        } else {
          break;
        }
      }
      // print("First sList $sList");
    }
  }

  @override
  void initState() {
    getclient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllClientCubit(MettingRepoImp())..getAllClients(),
      child: BlocBuilder<AllClientCubit, AllClientState>(
        builder: (context, state) {
          if (state is ClientsSucc) {
            if (sList.isNotEmpty) {
              state.Model.data?.forEach((element) {
                for (var e in sList) {
                  // print('${element.name} ${e.trim()}');
                  if (element.id == e.trim()) {
                    // print("//////////////////");

                    list2!.add(element);
                    // print(list2!.length);
                  }
                }
                // print(list2?.first);
              });
            }

            return InkWell(
              onTap: () {
                if (list2!.isNotEmpty) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          surfaceTintColor: Colors.white,
                          title: const Text(
                            "people in Mettings",
                          ),
                          content: StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
                              height: 120,
                              width: 120,
                              color: Colors.white,
                              child: ListView.builder(
                                itemCount: list2?.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(list2!
                                        .elementAt(index)
                                        .name
                                        .toString()),
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(1000000),
                                      child: CachedNetworkImage(
                                        height: 24,
                                        width: 24,
                                        imageUrl: list2!
                                                    .elementAt(index)
                                                    .image ==
                                                null
                                            ? 'https://system.tqnia.me/assets/images/avatar.jpg'
                                            : '$showImageurl${list2!.elementAt(index).image.toString().split('/').last}',
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
                                  );
                                },
                              ),
                            );
                          }),
                        );
                      });
                }
              },
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          list2!.elementAt(index);

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(1000000),
                            child: CachedNetworkImage(
                              height: 24,
                              width: 24,
                              imageUrl: list2!.elementAt(index).image == null
                                  ? 'https://system.tqnia.me/assets/images/avatar.jpg'
                                  : '$showImageurl${list2!.elementAt(index).image.toString().split('/').last}',
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
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 0,
                          );
                        },
                        itemCount: list2?.length ?? 0),
                  ),
                ],
              ),
            );
          } else if (state is Clientsfail) {
            return const Text('');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
