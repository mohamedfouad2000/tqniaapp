import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:intl/intl.dart';

import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_note_repo/add_note_repo_impl.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/note/note_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/note/note_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/leads_deatils_screen.dart';

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({
    super.key,
  });

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  TextEditingController CreationDatecont = TextEditingController();
  TextEditingController TittleCont = TextEditingController();
  TextEditingController DescriptionCont = TextEditingController();

  PlatformFile? pickFile;

  Future<void> uploadfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickFile = result.files.first;
      });
    }
  }

  String dn = DateFormat('MM-dd-yyyy hh:mm a').format(DateTime.now());
  var formKey = GlobalKey<FormState>();
  bool isEmpty = false;
  @override
  void initState() {
    CreationDatecont.text = dn;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(AddNoteRepoImp()),
      child: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {
          if (state is AddNoteSucc) {
            Fluttertoast.showToast(
                msg: 'created successfully',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);

            Nav(context, LeedsDetiles(id: int.parse(editModel!.id.toString())));
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "Create Note",
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
                          NoteCubit.get(context).addNote(
                            date: CreationDatecont.text,
                            id: '0',
                            title: TittleCont.text,
                            description: DescriptionCont.text,
                            file:
                                pickFile != null ? File(pickFile!.path!) : null,
                          );
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
                                  'Add Note',
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
}
