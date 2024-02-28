import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/constans/const.dart';

import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:intl/intl.dart';

import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_calls_repo/add_calls_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/leads_deatils_screen.dart';

class AddCallsForm extends StatefulWidget {
  const AddCallsForm({
    super.key,
  });

  @override
  State<AddCallsForm> createState() => _AddCallsFormState();
}

class _AddCallsFormState extends State<AddCallsForm> {
  TextEditingController CreationDatecont = TextEditingController();

  TextEditingController TittleCont = TextEditingController();
  TextEditingController DescriptionCont = TextEditingController();
  TextEditingController NoteCont = TextEditingController();

  String dn = DateFormat('MM-dd-yyyy hh:mm a').format(DateTime.now());
  String? callsState;
  bool isEmpty = false;
  List<String> statesList = [
    'Answered',
    'No answer',
    'Busy',
    'Not available',
    'Wrong number'
  ];

  var formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CreationDatecont.text = dn;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCallsCubit(AddCallsRepoImp()),
      child: BlocConsumer<AddCallsCubit, AddCallsState>(
        listener: (context, state) {
          if (state is AddnewCallsSucc) {
            Fluttertoast.showToast(
                msg: 'Created Done With Id = ${state.id.toString()}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
            Nav(context, LeedsDetiles(id: int.parse(editModel!.id.toString())));
          }
          if (state is AddnewCallsfail) {
            Fluttertoast.showToast(
                msg: state.eroorMsq.toString(),
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
                    "Create Call",
                    style: StylesData.font20,
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Call State",
                    style: StylesData.font16.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: DropdownSearch<String>(
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle:
                            StylesData.font14.copyWith(color: kMainColor),
                        dropdownSearchDecoration: InputDecoration(
                          suffixIconColor: Colors.grey[300],
                          hintText: 'Choose Region',
                          hintStyle: StylesData.font14
                              .copyWith(color: const Color(0x330D223F)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kMainColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      popupProps: PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              hintText: "Choose State",
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: kMainColor),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFEAEAEA)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFEAEAEA)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              // labelText: 'Password',
                            ),
                          )),
                      itemAsString: (String u) {
                        return u.toString();
                      },
                      onChanged: (i) {
                        setState(() {
                          callsState = i;
                        });
                      },
                      items: statesList,
                      enabled: true,
                      selectedItem: callsState,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  if (callsState == 'Answered')
                    customTextFormedFiled(
                      controller: NoteCont,
                      hintText: 'Write Note',
                    ),
                  if (callsState == 'Answered')
                    const SizedBox(
                      height: 12,
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
                      //       //DateTime.now() - not to allow to choose before today.
                      //       lastDate: DateTime(2100));

                      //   if (pickedDate != null) {
                      //     print(
                      //         pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      //     String formattedDate =
                      //         DateFormat('yyyy-MM-dd').format(pickedDate);
                      //     print(
                      //         formattedDate); //formatted date output using intl package =>  2021-03-16

                      //     CreationDatecont.text =
                      //         formattedDate; //set output date to TextField value.
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
                          if (callsState != null && callsState != '') {
                            AddCallsCubit.get(context).addCall(
                                id: '0',
                                status: callsState ?? '',
                                date: CreationDatecont.text,
                                notes: NoteCont.text,
                                description: DescriptionCont.text);
                          } else {
                            setState(() {
                              isEmpty = true;
                            });
                          }
                        }
                      },
                      textWidget: state is AddnewCallsLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Add Call',
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
