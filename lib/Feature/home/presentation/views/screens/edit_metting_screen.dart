import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tqniaapp/Core/constans/const.dart';

import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';

import 'package:dotted_border/dotted_border.dart';

import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/model/all_clients_model/datum.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';

class EditMettingScreen extends StatefulWidget {
  const EditMettingScreen({
    super.key,
    required this.model,
  });
  final Meeting model;
  @override
  State<EditMettingScreen> createState() => _EditMettingScreenState();
}

class _EditMettingScreenState extends State<EditMettingScreen> {
  TextEditingController labelcont = TextEditingController();
  TextEditingController TittleCont = TextEditingController();
  TextEditingController DescriptionCont = TextEditingController();
  TextEditingController LocationCont = TextEditingController();

  String? Startdate;
  List<Datum>? list = [];
  Set<Datum>? list2 = {};
  String? enddate;
  String? StartTime;
  String? endTime;
  Color? colorvalue;
  bool isEmpty = false;
  List<String> sList = [];
  Color? colorChoose = Colors.black;
  Future<void> getclient() async {
    String? x = widget.model.shareWith;
    if (x != null) {
      while (x != null) {
        String y = x.split(',').first;
        print(y);
        print(x);
        sList.add(y);
        x = x.substring(y.length + 1, x.length);
      }
      print("First sList $sList");
    }
  }

  var formkey = GlobalKey<FormState>();
  @override
  void initState() {
    getclient();
    print('/////////////////');
    print(widget.model.shareWith);
    //member:110,member:10,member:1

    super.initState();
    labelcont.text = widget.model.labels ?? '';
    TittleCont.text = widget.model.title ?? '';
    DescriptionCont.text = widget.model.description ?? '';
    LocationCont.text = widget.model.location ?? '';
    colorChoose = colorHex(widget.model.color.toString());
    Startdate = widget.model.startDate ?? '';
    endTime = widget.model.endTime ?? '';
    enddate = widget.model.endDate ?? '';
    StartTime = widget.model.startTime ?? '';
    print(sList.length);
    print(widget.model.shareWith);
  }

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
      ),
      body: BlocProvider(
        create: (context) => MettingsCubit(MettingRepoImp())..getAllClients(),
        child: BlocConsumer<MettingsCubit, MettingsState>(
          listener: (context, state) {
            if (state is AddMettingSucc) {
              Fluttertoast.showToast(
                  msg: state.txt.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 18.0);
              Nav(context, const HomeView());
            } else if (state is AddMettingfail) {
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
            if (state is getAllClientsSucc) {
              print(sList);
              if (sList.isNotEmpty) {
                state.Model.data?.forEach((element) {
                  for (var e in sList) {
                    print('${element.name} ${e.trim()}');
                    if (element.id == e.trim()) {
                      print("//////////////////");
                      list2!.add(element);
                      print(list2!.length);
                    }
                  }
                  // print(list2?.first);
                });
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          "Edit Meeting",
                          style: StylesData.font20,
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Title",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: TittleCont, hintText: 'Test'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Description",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: DescriptionCont,
                            hintText: 'Write Description',
                            maxLines: 6),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Label",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                          controller: labelcont,
                          hintText: 'Enter Label',
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Location",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                          controller: LocationCont,
                          hintText: 'Enter Location',
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Text(
                          "Date and time",
                          style: StylesData.font16.copyWith(
                            color: const Color(0xFF040415),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AddDateAndTime(),
                        const SizedBox(
                          height: 48,
                        ),
                        Text(
                          "Share With",
                          style: StylesData.font16.copyWith(
                            color: const Color(0xFF040415),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      String? statusValue;
                                      return AlertDialog(
                                        surfaceTintColor: Colors.white,
                                        title: const Text(
                                          "Share With People",
                                        ),
                                        content: StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return SizedBox(
                                            height: 150,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 55,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 13.76,
                                                    left: 17,
                                                    right: 16.56,
                                                    bottom: 13.24,
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: const BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFFEAEAEA)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      value: statusValue,
                                                      isDense: true,
                                                      isExpanded: true,
                                                      icon: Icon(
                                                        Icons.arrow_downward,
                                                        color: Colors.grey
                                                            .withOpacity(.4),
                                                      ),
                                                      hint: Text(
                                                        'Choose Person',
                                                        style: StylesData.font14
                                                            .copyWith(
                                                                color: const Color(
                                                                    0x330D223F)),
                                                      ),
                                                      style: StylesData.font14
                                                          .copyWith(
                                                              color:
                                                                  kMainColor),
                                                      onChanged:
                                                          (String? value) {
                                                        // stateId =
                                                        setState(() {
                                                          print(value);
                                                          statusValue =
                                                              value.toString();
                                                        });
                                                      },
                                                      items: state.Model.data!
                                                          .map<
                                                              DropdownMenuItem<
                                                                  String>>((Datum?
                                                              value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value?.id
                                                              .toString(),
                                                          child: Text(value
                                                                  ?.name
                                                                  .toString() ??
                                                              ''),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                defaultButton(
                                                    height: 40,
                                                    fun: () {
                                                      if (statusValue != null) {
                                                        for (var element
                                                            in state
                                                                .Model.data!) {
                                                          if (element.id ==
                                                              statusValue) {
                                                            list!.add(element);
                                                            setState(() {
                                                              Navigator.pop(
                                                                  context,
                                                                  list2);
                                                            });
                                                          }
                                                        }
                                                      } else {}
                                                    },
                                                    textWidget: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Add Person',
                                                          style: StylesData
                                                              .font14
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        const Icon(
                                                          Icons
                                                              .arrow_forward_rounded,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                    c: kMainColor)
                                              ],
                                            ),
                                          );
                                        }),
                                      );
                                    }).whenComplete(() {
                                  setState(() {
                                    list2 = {...list!};
                                  });
                                });
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                color: kMainColor,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.add,
                                      color: kMainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      list2!.elementAt(index);
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000000),
                                        child: CachedNetworkImage(
                                          height: 50,
                                          width: 50,
                                          imageUrl: list2!
                                                      .elementAt(index)
                                                      .image ==
                                                  null
                                              ? 'https://system.tqnia.me/assets/images/avatar.jpg'
                                              : '$showImageurl${list2!.elementAt(index).image.toString().split('/').last}',
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
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        width: 5,
                                      );
                                    },
                                    itemCount: list2?.length ?? 0),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Row(
                          children: [
                            Text(
                              "Color",
                              style: StylesData.font16.copyWith(
                                color: const Color(0xFF040415),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            CircleAvatar(
                              backgroundColor: colorChoose,
                              radius: 5,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  colorChoose = const Color(0xFFFF0091);
                                });
                              },
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFFF0091),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  colorChoose =
                                      const Color.fromARGB(255, 45, 0, 150);
                                });
                              },
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: const Color.fromARGB(255, 45, 0, 150),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  colorChoose =
                                      const Color.fromARGB(255, 12, 139, 0);
                                });
                              },
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: const Color.fromARGB(255, 12, 139, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            if (colorvalue != null)
                              Container(
                                width: 44,
                                height: 44,
                                decoration: ShapeDecoration(
                                  color: colorvalue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            if (colorvalue != null)
                              const SizedBox(
                                width: 16,
                              ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  useSafeArea: true,
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  barrierColor: Colors.black
                                      .withOpacity(0.4000000059604645)
                                      .withOpacity(0.3),
                                  builder: (context) => Container(
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                          child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            ColorPicker(
                                              color: Colors.blue,
                                              onChanged: (value) {
                                                setState(() {
                                                  colorvalue = value;
                                                });
                                              },
                                              initialPicker: Picker.paletteHue,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                setState(() {
                                                  colorvalue;
                                                  colorChoose = colorvalue;
                                                });
                                              },
                                              child: const Text(
                                                "Choose Color",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))),
                                );
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                color: kMainColor,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.add,
                                      color: kMainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
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
                                String x = '';
                                if (Startdate != null && enddate != null) {
                                  print(list2);
                                  list2?.forEach((element) {
                                    x = '$x${element.id},';
                                  });
                                  print(
                                      " //////////////////////////////////////// $x");
                                  MettingsCubit.get(context).addMetting(
                                      shareWith: x,
                                      title: TittleCont.text,
                                      description: DescriptionCont.text,
                                      labels: labelcont.text,
                                      color: colorChoose != null
                                          ? '#${colorChoose.toString().substring(10, colorChoose.toString().length - 1)}'
                                          : '#9e9e9e',
                                      location: LocationCont.text,
                                      id: int.parse(widget.model.id!),
                                      start_date: Startdate!,
                                      end_time: enddate!,
                                      startTime: StartTime ?? '01:00:00',
                                      enddate: enddate ?? '01:00:00');
                                } else {
                                  setState(() {
                                    isEmpty = true;
                                  });
                                }
                              }
                            },
                            textWidget: state is AddMettingLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Edit Meeting',
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
                ),
              );
            } else if (state is getAllClientsfail) {
              return const FailureWidget();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Row AddDateAndTime() {
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
                    var pickedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (pickedTime != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(pickedTime);
                      //2024-02-07 09:01:12
                      StartTime = '${pickedTime.hour}:${pickedTime.minute}';
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
                      Startdate != null ? Startdate! : 'Tab Here to add Date',
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
    );
  }
}
