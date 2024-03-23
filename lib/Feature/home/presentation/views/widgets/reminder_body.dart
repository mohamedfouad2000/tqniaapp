import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/reminder_model/datum.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/reminder/reminder_cubit.dart';

class ReminderBody extends StatelessWidget {
  const ReminderBody({
    super.key,
    required this.list,
  });
  final List<Datum>? list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Slidable(
                  key: ValueKey(
                    int.parse(list![index].id!),
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      InkWell(
                        onTap: () async {
                          //
                          await BlocProvider.of<ReminderCubit>(context)
                              .makeReminderIsDone(
                                  id: int.parse(list![index].id.toString()));
                        },
                        child: const SizedBox(
                          width: 75,
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                AssetsData.checkDone,
                              ),
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await BlocProvider.of<ReminderCubit>(context)
                              .deleteReminder(
                                  id: int.parse(list![index].id.toString()));
                        },
                        child: const SizedBox(
                          width: 75,
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                AssetsData.delete,
                              ),
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.46, color: Color(0xFFF4F4F4)),
                        borderRadius: BorderRadius.circular(20.59),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x11EA5A5A),
                          blurRadius: 62.86,
                          offset: Offset(14.61, 18.65),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.red,
                          child: Center(
                            child: ImageIcon(
                              AssetImage(
                                AssetsData.clockIcon,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                list?[index].title ?? '',
                                style: StylesData.font14
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                "Add By ${list?[index].createdByName ?? ''}",
                                style: StylesData.font8,
                              ),
                            ],
                          ),
                        ),
                        if (list?[index].reminderStatus == 'new')
                          Center(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFE92929),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: list?.length ?? 0),
        ),
      ],
    );
  }
}
