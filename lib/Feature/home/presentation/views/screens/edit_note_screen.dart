import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';

import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/notes_model/note.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_note_repo/add_note_repo_impl.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/note/note_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/note/note_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    super.key,
    required this.model,
  });
  final Note model;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController CreationDatecont = TextEditingController();
  TextEditingController TittleCont = TextEditingController();
  TextEditingController DescriptionCont = TextEditingController();

  PlatformFile? pickFile;
  bool isEmpty = false;

  Future<void> uploadfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickFile = result.files.first;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CreationDatecont.text = widget.model.createdAt.toString();
    TittleCont.text = widget.model.title.toString();
    DescriptionCont.text = widget.model.description.toString();
    // pickFile!.name = widget.model.files.toString();
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
        create: (context) => NoteCubit(AddNoteRepoImp()),
        child: BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {
            if (state is AddNoteSucc) {
              Fluttertoast.showToast(
                  msg: 'Edit successfully',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 18.0);
              NavegatorPush(context, const HomeView());
            }
            if (state is AddNoteFail) {
              Fluttertoast.showToast(
                  msg: state.errorMsq.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 18.0);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        "edit Note",
                        style: StylesData.font20,
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Creation Date",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                          // onTap: () async {
                          //   DateTime? pickedDate = await showDatePicker(
                          //       context: context,
                          //       initialDate: DateTime.now(),
                          //       firstDate: DateTime(1950),
                          //       lastDate: DateTime(2100));

                          //   if (pickedDate != null) {
                          //     var pickedTime = await showTimePicker(
                          //         context: context,
                          //         initialTime: TimeOfDay.now());
                          //     if (pickedTime != null) {
                          //       String formattedDate =
                          //           DateFormat('yyyy-MM-dd').format(pickedDate);
                          //       print(pickedTime);
                          //       //2024-02-07 09:01:12
                          //       CreationDatecont.text =
                          //           '$formattedDate ${pickedTime.hour}:${pickedTime.minute}:08';
                          //     }

                          //     //set output date to TextField value.
                          //   } else {}
                          // },
                          child: customTextFormedFiled(
                              controller: CreationDatecont,
                              hintText: 'Date',
                              enabled: false,
                              sufficon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ImageIcon(
                                  AssetImage(
                                    AssetsData.calendar,
                                  ),
                                  size: 18,
                                ),
                              ))),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Title",
                        style: StylesData.font16.copyWith(color: Colors.black),
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
                      if (isEmpty)
                        Container(
                          width: double.infinity,
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
                            if (formKey.currentState!.validate()) {
                              if (pickFile?.name == null) {
                                setState(() {
                                  isEmpty = true;
                                });
                              } else {
                                NoteCubit.get(context).addNote(
                                    date: CreationDatecont.text,
                                    id: widget.model.id!,
                                    title: TittleCont.text,
                                    description: DescriptionCont.text,
                                    file: File(pickFile!.path!));
                              }
                            }
                          },
                          textWidget: state is AddNoteLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'edit Note',
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
          },
        ),
      ),
    );
  }
}
