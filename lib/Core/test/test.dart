import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var StartTime;
  var endTime;
  var Startdate;
  var enddate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
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
                          var pickedTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (pickedTime != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(pickedTime);
                            //2024-02-07 09:01:12
                            StartTime =
                                '${pickedTime.hour}:${pickedTime.minute}';
                          }
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16

                          // CreationDatecont.text =
                          //     formattedDate; //set output date to TextField value.
                          setState(() {
                            Startdate = formattedDate;
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
                            Startdate != null
                                ? Startdate!
                                : 'Tab Here to add Date',
                            style: StylesData.font10.copyWith(
                              color: const Color(0xFFA29EB6),
                            ),
                          ),
                          Text(
                            StartTime != null ? StartTime! : '',
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
                          var pickedTime = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (pickedTime != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(pickedTime);
                            //2024-02-07 09:01:12
                            endTime = '${pickedTime.hour}:${pickedTime.minute}';
                          }
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            enddate = formattedDate;
                          });
                          //set output date to TextField value.
                        } else {}
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Date",
                            style: StylesData.font12.copyWith(
                              color: const Color(0xFF0D223F),
                            ),
                          ),
                          Text(
                            enddate != null ? enddate! : 'Tab Here to add Date',
                            style: StylesData.font10.copyWith(
                              color: const Color(0xFFA29EB6),
                            ),
                          ),
                          Text(
                            endTime != null ? endTime! : '',
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
          ),
        ],
      ),
    );
  }
}
