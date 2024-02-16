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
import 'package:tqniaapp/Feature/home/data/model/client_model/client_model.dart';
import 'package:tqniaapp/Feature/home/data/model/get_ticket_type/get_ticket_type.dart';
import 'package:tqniaapp/Feature/home/data/model/label_model/assgin_to.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/ticket_info_screen.dart';

class AddTiketsForm extends StatefulWidget {
  const AddTiketsForm({
    super.key,
  });

  @override
  State<AddTiketsForm> createState() => _AddTiketsFormState();
}

class _AddTiketsFormState extends State<AddTiketsForm> {
  TextEditingController TittleCont = TextEditingController();
  TextEditingController ClientCont = TextEditingController();
  TextEditingController RequestedbyCont = TextEditingController();
  TextEditingController TickettypeCont = TextEditingController();
  TextEditingController DescriptionCont = TextEditingController();
  TextEditingController AssignedToCont = TextEditingController();
  TextEditingController LabelCont = TextEditingController();
  TextEditingController UploadFileCont = TextEditingController();
  PlatformFile? pickFile;

  List<String> list = <String>[
    'States option1',
    'States option2',
    'States option3',
    'States option4'
  ];

  String? clientItem;
  String? requestedbyItem;
  String? assignItem;
  String? projectsItem;

  String? ticketsTypesItem;
  String? labelsItem;
  var formkey = GlobalKey<FormState>();
  Future<void> uploadfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickFile = result.files.first;
      });
    }
  }

  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddticketCubit(AddTicketRepoImpl())
          ..getLabels()
          ..getClients()
          ..getTicketTypes()
          ..getAssginTo()
          ..getRequestedBy()
          ..getProjects(),
        child: BlocConsumer<AddticketCubit, AddticketState>(
          builder: (context, state) {
            if (AddticketCubit.get(context).clients.isNotEmpty &&
                AddticketCubit.get(context).ticketsTypes.isNotEmpty &&
                AddticketCubit.get(context).labels != null &&
                AddticketCubit.get(context).assginTo.isNotEmpty &&
                AddticketCubit.get(context).projects != null &&
                AddticketCubit.get(context).requestedBy.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        "Create Ticket",
                        style: StylesData.font20,
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Title",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFormedFiled(
                          controller: TittleCont, hintText: 'Title'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Client",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 13.76,
                          left: 17,
                          right: 16.56,
                          bottom: 13.24,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: clientItem,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Choose Client',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                clientItem = value!;
                              });
                            },
                            items: AddticketCubit.get(context)
                                .clients
                                .map<DropdownMenuItem<String>>(
                                    (ClientModel value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.name ?? ''),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Requested by",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 13.76,
                          left: 17,
                          right: 16.56,
                          bottom: 13.24,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: requestedbyItem,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Requested By',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                requestedbyItem = value!;
                              });
                            },
                            items: AddticketCubit.get(context)
                                .requestedBy
                                .map<DropdownMenuItem<String>>(
                                    (ClientModel value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.name ?? ''),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Ticket type",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 13.76,
                          left: 17,
                          right: 16.56,
                          bottom: 13.24,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: ticketsTypesItem,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Choose source',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                ticketsTypesItem = value!;
                              });
                            },
                            items: AddticketCubit.get(context)
                                .ticketsTypes
                                .map<DropdownMenuItem<String>>(
                                    (TicketType value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.name ?? ''),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
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
                        "Assigned to",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 13.76,
                          left: 17,
                          right: 16.56,
                          bottom: 13.24,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: assignItem,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Requested By',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                assignItem = value!;
                              });
                            },
                            items: AddticketCubit.get(context)
                                .assginTo
                                .map<DropdownMenuItem<String>>(
                                    (ClientModel value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.name ?? ''),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Project",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 13.76,
                          left: 17,
                          right: 16.56,
                          bottom: 13.24,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: projectsItem,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Project',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                projectsItem = value!;
                              });
                            },
                            items: AddticketCubit.get(context)
                                .projects
                                .map<DropdownMenuItem<String>>(
                                    (ClientModel value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.name ?? ''),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Label",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 13.76,
                          left: 17,
                          right: 16.56,
                          bottom: 13.24,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            value: labelsItem,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Choose Label',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                labelsItem = value!;
                              });
                            },
                            items: AddticketCubit.get(context)
                                .labels
                                ?.data
                                ?.assginTo
                                ?.map<DropdownMenuItem<String>>(
                                    (AssginTo value) {
                              return DropdownMenuItem<String>(
                                value: value.id,
                                child: Text(value.text.toString()),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
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
                            if (formkey.currentState!.validate()) {
                              if (labelsItem != null &&
                                  clientItem != null &&
                                  ticketsTypesItem != null &&
                                  assignItem != null &&
                                  requestedbyItem != null &&
                                  pickFile != null) {
                                AddticketCubit.get(context).addTicket(
                                    title: TittleCont.text,
                                    id: '0',
                                    projectId: projectsItem == null
                                        ? ''
                                        : projectsItem.toString(),
                                    tickettypeid: ticketsTypesItem.toString(),
                                    clientid: clientItem.toString(),
                                    assignedto: assignItem.toString(),
                                    labels: labelsItem.toString(),
                                    requestedbyid: requestedbyItem.toString(),
                                    description: DescriptionCont.text,
                                    file: File(pickFile!.path!));
                              } else {
                                setState(() {
                                  isEmpty = true;
                                });
                              }
                            }
                          },
                          textWidget: state is AddTicketloading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add new Ticket',
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
            } else if (state is GetLabelsFailure) {
              return Center(
                child: Text(state.errorMsq),
              );
            } else if (state is GetAssignToFailuire) {
              return Center(
                child: Text(state.errorMsq),
              );
            } else if (state is GetProjectsFailuire) {
              return Center(
                child: Text(state.errorMsq),
              );
            } else if (state is GetRequestedByFailuire) {
              return Center(
                child: Text(state.errorMsq),
              );
            } else if (state is GetClientsFailuire) {
              return Center(
                child: Text(state.errorMsq),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          listener: (BuildContext context, AddticketState state) {
            if (state is AddTicketSucc) {
              Fluttertoast.showToast(
                  msg: state.id.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 18.0);
              NavegatorPush(context, TicketInfoScreen(id: state.id));
            } else if (state is AddTicketFailuire) {
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
        ));
  }
}
