import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:intl/intl.dart';

import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_calls_repo/add_calls_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';

class AddCallsForm extends StatefulWidget {
  const AddCallsForm({
    super.key,
  });

  @override
  State<AddCallsForm> createState() => _AddCallsFormState();
}

class _AddCallsFormState extends State<AddCallsForm> {
  TextEditingController CreationDatecont = TextEditingController();
  TextEditingController stateCont = TextEditingController();

  TextEditingController TittleCont = TextEditingController();
  TextEditingController DescriptionCont = TextEditingController();

  String dn = DateFormat('MM-dd-yyyy hh:mm a').format(DateTime.now());

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
            NavegatorPush(context, const HomeView());
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
                  customTextFormedFiled(
                    controller: stateCont,
                    hintText: 'State',
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
                              id: '0',
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
