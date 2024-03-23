import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/Reminders_repo/reminder_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/reminder/reminder_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/reminder/reminder_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';

class AddReminderForm extends StatefulWidget {
  const AddReminderForm({
    super.key,
  });

  @override
  State<AddReminderForm> createState() => _AddReminderFormState();
}

class _AddReminderFormState extends State<AddReminderForm> {
  TextEditingController nameCountroller = TextEditingController();
  String? startdate;
  bool isEmpty = false;

  String? startTime;

  var formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReminderCubit(ReminderRepoImp()),
      child: BlocConsumer<ReminderCubit, ReminderState>(
        listener: (context, state) {
          if (state is AddReminderSucc) {
            Fluttertoast.showToast(
                msg: 'created Done',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
            Nav(context, const HomeView());
          } else if (state is AddReminderFailure) {
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
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "Add Reminder",
                    style: StylesData.font20,
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Reminder Name",
                    style: StylesData.font16.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  customTextFormedFiled(
                    controller: nameCountroller,
                    hintText: 'Reminder Name',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Date And Time",
                    style: StylesData.font16.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  addDateAndTime(),
                  const SizedBox(
                    height: 48,
                  ),
                  if (isEmpty)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(078),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
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
                              'Enter All required fileds',
                              style: StylesData.font14
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (isEmpty)
                    const SizedBox(
                      height: 24,
                    ),
                  defaultButton(
                      fun: () {
                        if (formkey.currentState!.validate()) {
                          if (startTime != null && startdate != null) {
                            BlocProvider.of<ReminderCubit>(context).addReminder(
                                startDate: startdate ?? '',
                                startTime: startTime ?? '',
                                title: nameCountroller.text);
                          } else {
                            setState(() {
                              isEmpty = true;
                            });
                          }
                        }
                      },
                      textWidget: state is AddReminderLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Add Reminder',
                                  style: StylesData.font14
                                      .copyWith(color: Colors.white),
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
            ),
          );
        },
      ),
    );
  }

  Row addDateAndTime() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF0D223F),
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
                width: 4,
              ),
              InkWell(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16

                    // CreationDatecont.text =
                    //     formattedDate; //set output date to TextField value.
                    setState(() {
                      startdate = formattedDate;
                    });
                  } else {}
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Date",
                      style: StylesData.font12.copyWith(
                        color: const Color(0xFF0D223F),
                      ),
                    ),
                    Text(
                      startdate != null ? startdate! : 'Tab Here to add Date',
                      style: StylesData.font10.copyWith(
                        color: const Color(0xFFA29EB6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFE92929),
                radius: 18,
                child: Center(
                    child: ImageIcon(
                  AssetImage(
                    AssetsData.clockIcon,
                  ),
                  size: 20,
                  color: Colors.white,
                )),
              ),
              const SizedBox(
                width: 4,
              ),
              InkWell(
                onTap: () async {
                  var pickedTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (pickedTime != null) {
                    print(pickedTime);
                    setState(() {
                      startTime = '${pickedTime.hour}:${pickedTime.minute}';
                    });
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Time",
                      style: StylesData.font12.copyWith(
                        color: const Color(0xFF0D223F),
                      ),
                    ),
                    Text(
                      startTime != null ? startTime! : 'Tab Here to add Time',
                      style: StylesData.font10.copyWith(
                        color: const Color(0xFFA29EB6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
