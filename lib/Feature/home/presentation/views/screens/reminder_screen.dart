import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/Reminders_repo/reminder_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/reminder/reminder_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/reminder/reminder_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/add_reminder_form.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/reminder_body.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReminderCubit(ReminderRepoImp())..getReminder(),
      child: BlocConsumer<ReminderCubit, ReminderState>(
        listener: (context, state) {
          if (state is DeleteReminderFailure) {
            Fluttertoast.showToast(
                msg: state.errormsq.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
          }
          if (state is MakeRemiderIsDoneFailure) {
            Fluttertoast.showToast(
                msg: state.errormsq.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
          }
          if (state is MakeRemiderIsDoneSucc) {
            Fluttertoast.showToast(
                msg: 'Remider Is Done',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
            Nav(context, const HomeView());
          }
          if (state is DeleteReminderSucc) {
            Fluttertoast.showToast(
                msg: 'Remider Is Deleted',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
            Nav(context, const HomeView());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kbackColor,
              foregroundColor: kbackColor,
              centerTitle: true,
              title: Text(
                "Reminders",
                style: StylesData.font18.copyWith(color: Colors.black),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        isScrollControlled: true,
                        showDragHandle: true,
                        backgroundColor: Colors.white,
                        barrierColor: Colors.black
                            .withOpacity(0.4000000059604645)
                            .withOpacity(0.3),
                        builder: (context) {
                          return Container(
                            color: Colors.white,
                            height: SizeConfig.screenHeight!,
                            child: const SingleChildScrollView(
                                child: AddReminderForm()),
                          );
                        },
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
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(builder: (context) {
                if (state is GetReminderSucc) {
                  if (state.model.data!.isEmpty) {
                    return const Center(child: Text("Empty List"));
                  }
                  return ReminderBody(list: state.model.data);
                } else if (state is GetReminderFailure) {
                  return Center(child: Text(state.errormsq));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
          );
        },
      ),
    );
  }
}
