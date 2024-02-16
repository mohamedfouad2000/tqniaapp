import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';

import 'package:dotted_border/dotted_border.dart';

import 'package:tqniaapp/Core/utils/styles.dart';

class AddEventForm extends StatefulWidget {
  const AddEventForm({
    super.key,
  });

  @override
  State<AddEventForm> createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  TextEditingController labelcont = TextEditingController();
  TextEditingController TittleCont = TextEditingController();
  TextEditingController DescriptionCont = TextEditingController();
  TextEditingController LocationCont = TextEditingController();
  PlatformFile? pickFile;
  List<String> list = <String>[
    'States option1',
    'States option2',
    'States option3',
    'States option4'
  ];
  Color? colorvalue;

  String? dropdownValue1;
  Future<void> uploadfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            "Create Event",
            style: StylesData.font20,
          )),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Tittle",
            style: StylesData.font16.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          customTextFormedFiled(controller: TittleCont, hintText: 'Test'),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Description",
            style: StylesData.font16.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          customTextFiled(
              controller: DescriptionCont,
              hintText: 'Write Description',
              maxLines: 6),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Upload File",
            style: StylesData.font16.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () async {
              await uploadfile();
            },
            child: SizedBox(
              width: double.infinity,
              height: 190,
              child: pickFile == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ImageIcon(
                          AssetImage(AssetsData.Icon),
                          size: 29,
                          color: Color(0xFF3B4657),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          pickFile == null
                              ? 'Upload File'
                              : pickFile!.name.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontSize: 14.74,
                              color: Color(0xFF150A33),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        pickFile == null
                            ? 'Upload File'
                            : pickFile!.name.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontSize: 14.74,
                            color: Color(0xFF150A33),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(
            height: 24,
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
              const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(AssetsData.person1),
              ),
              const SizedBox(
                width: 16,
              ),
              const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(AssetsData.person1),
              ),
              const SizedBox(
                width: 16,
              ),
              const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(AssetsData.person1),
              ),
              const SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {},
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: kMainColor,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            "Color",
            style: StylesData.font16.copyWith(
              color: const Color(0xFF040415),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFF0091),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 44,
                height: 44,
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 45, 0, 150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 44,
                height: 44,
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 12, 139, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              if (colorvalue == null)
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
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      colorvalue;
                                    });
                                  },
                                  child: Text(
                                    "Choose Color",
                                  ),
                                ),
                              ],
                            ),
                          ))),
                    );

                    // ColorPicker(
                    //             color: Colors.blue,

                    //             onChanged: (value) {
                    //               // colorvalue =value;
                    //             },
                    //             initialPicker: Picker.paletteHue,
                    //           );
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: kMainColor,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          defaultButton(
              fun: () {
                Fluttertoast.showToast(
                    msg: 'not Avaliable Now',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 18.0);
                // NavegatorPush(context, const TicketInfoScreen());
              },
              textWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add event',
                    style: StylesData.font14.copyWith(color: Colors.white),
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
    );
  }

  Row AddDateAndTime() {
    return Row(
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
                'Tab Here to add Date',
                style: StylesData.font10.copyWith(
                  color: const Color(0xFFA29EB6),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
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
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16

              // CreationDatecont.text =
              //     formattedDate; //set output date to TextField value.
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
                'Tab Here to add Date',
                style: StylesData.font10.copyWith(
                  color: const Color(0xFFA29EB6),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
