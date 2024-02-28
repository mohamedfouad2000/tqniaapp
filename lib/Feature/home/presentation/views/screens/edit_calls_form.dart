import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';

import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/calls_model/call.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_calls_repo/add_calls_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_state.dart';

class EditCallsForm extends StatefulWidget {
  const EditCallsForm({
    super.key,
    required this.model,
  });
  final Call model;

  @override
  State<EditCallsForm> createState() => _EditCallsFormState();
}

class _EditCallsFormState extends State<EditCallsForm> {
  TextEditingController CreationDatecont = TextEditingController();
  TextEditingController DescriptionCont = TextEditingController();
  TextEditingController stateCont = TextEditingController();

  var formkey = GlobalKey<FormState>();
  List<String> statesList = [
    'Answered',
    'No answer',
    'Busy',
    'Not available',
    'Wrong number'
  ];
  String? callsState;

  @override
  void initState() {
    CreationDatecont.text = widget.model.createdAt ?? '';
    callsState = widget.model.status ?? '';
    DescriptionCont.text = widget.model.notes ?? '';
    super.initState();
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
              Navigator.pop(context);

              // AddCallsCubit.get(context).getCalls();
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
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        "Edit Call",
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
                            ),
                          ),
                          popupProps: PopupProps.menu(
                              showSearchBox: true,
                              searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                  hintText: "Choose Owner",
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
                            callsState = i;
                            print(i);
                          },
                          items: statesList,
                          enabled: true,
                          selectedItem: callsState,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
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
                        "Description",
                        style: StylesData.font16.copyWith(color: Colors.black),
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
                      defaultButton(
                          fun: () {
                            if (formkey.currentState!.validate()) {
                              AddCallsCubit.get(context).addCall(
                                  id: widget.model.id.toString(),
                                  status: stateCont.text,
                                  date: CreationDatecont.text,
                                  notes: DescriptionCont.text,
                                  description: DescriptionCont.text);
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
                                      'edit  Call',
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
