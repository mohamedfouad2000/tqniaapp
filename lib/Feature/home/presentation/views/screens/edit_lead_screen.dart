import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';

import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/AddLead/add_lead_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/AddLead/add_lead_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/leads_deatils_screen.dart';

class EditLeadScreen extends StatefulWidget {
  const EditLeadScreen({super.key, required this.editModel});
  final Lead editModel;

  @override
  State<EditLeadScreen> createState() => _EditLeadScreenState();
}
//city,state,zip,country

class _EditLeadScreenState extends State<EditLeadScreen> {
  TextEditingController? NameCont = TextEditingController();
  TextEditingController? StatusCont = TextEditingController();
  TextEditingController? OwnerCont = TextEditingController();
  TextEditingController? SourceCont = TextEditingController();
  TextEditingController? AddressCont = TextEditingController();
  TextEditingController? PhoneCont = TextEditingController();
  TextEditingController? MobileCont = TextEditingController();
  TextEditingController? WebsiteCont = TextEditingController();
  TextEditingController? IndustryCont = TextEditingController();
  TextEditingController? NoteCont = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String? statusValue;
  String? regionItem;

  String? Source;
  String? owener;
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {

    NameCont?.text = widget.editModel.companyName.toString();
    statusValue = widget.editModel.leadStatusId == ''
        ? null
        : widget.editModel.leadStatusId;
    owener = widget.editModel.ownerId;
    // regionItem=widget.editModel.address,
    Source = widget.editModel.leadSourceId == ''
        ? null
        : widget.editModel.leadSourceId;
    SourceCont?.text = widget.editModel.leadSourceId.toString();
    AddressCont?.text = widget.editModel.address.toString();
    IndustryCont?.text = widget.editModel.industry.toString();

    regionItem = widget.editModel.region == ''
        ? null
        : widget.editModel.region;
        


    PhoneCont?.text = widget.editModel.phone.toString();
    MobileCont?.text = widget.editModel.vatNumber.toString();
    WebsiteCont?.text = widget.editModel.website.toString();
    // IndustryCont?.text = widget.editModel.currency.toString();
    NoteCont?.text = widget.editModel.note.toString();

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
        create: (context) => AddLeadCubit(HomeRepoImp())
          ..getOwners()
          ..getLeadStatus()
          ..getLeadSources()
          ..getRegion(),
        child: BlocConsumer<AddLeadCubit, AddLeadState>(
          builder: (context, state) {
            if (AddLeadCubit.get(context).sourceModel.isNotEmpty &&
                AddLeadCubit.get(context).statusModel.isNotEmpty &&
                AddLeadCubit.get(context).regionList.isNotEmpty &&
                AddLeadCubit.get(context).ownerModel.isNotEmpty) {
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
                          "Edit Leed",
                          style: StylesData.font20,
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Leed Name",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: NameCont, hintText: 'Name'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Status",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
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
                                    hintText: "Choose Status",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: kMainColor),
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
                              String x = '';
                              AddLeadCubit.get(context)
                                  .statusModel
                                  .forEach((element) {
                                if (u == element.id) x = element.title!;
                              });
                              return x.toString();
                            },
                            onChanged: (i) {
                              print(i);
                              statusValue = i;
                              print(i);
                            },
                            items: [
                              ...List.generate(
                                  AddLeadCubit.get(context).statusModel.length,
                                  (index) => AddLeadCubit.get(context)
                                      .statusModel[index]
                                      .id
                                      .toString()),
                            ],
                            enabled: true,
                            selectedItem: statusValue,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Owner",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
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
                                      borderSide: BorderSide(
                                          width: 1, color: kMainColor),
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
                              String x = '';
                              AddLeadCubit.get(context)
                                  .ownerModel
                                  .forEach((element) {
                                if (u == element.id) x = element.name!;
                              });
                              return x.toString();
                            },
                            onChanged: (i) {
                              owener = i;
                              print(i);
                            },
                            items: [
                              ...List.generate(
                                  AddLeadCubit.get(context).ownerModel.length,
                                  (index) => AddLeadCubit.get(context)
                                      .ownerModel[index]
                                      .id
                                      .toString()),
                            ],
                            enabled: true,
                            selectedItem: owener,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Source",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
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
                                hintText: 'Choose Source',
                                hintStyle: StylesData.font14
                                    .copyWith(color: const Color(0x330D223F)),
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
                                    hintText: "Choose Source",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: kMainColor),
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
                              String x = '';
                              AddLeadCubit.get(context)
                                  .sourceModel
                                  .forEach((element) {
                                if (u == element.id) x = element.title!;
                              });
                              return x.toString();
                            },
                            onChanged: (i) {
                              Source = i;
                            },
                            items: [
                              ...List.generate(
                                  AddLeadCubit.get(context).sourceModel.length,
                                  (index) => AddLeadCubit.get(context)
                                      .sourceModel[index]
                                      .id
                                      .toString()),
                            ],
                            enabled: true,
                            selectedItem: Source,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Address",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFiled(
                            controller: AddressCont!,
                            hintText: 'Write Your Address'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Phone",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: PhoneCont,
                            hintText: 'Your Phone',
                            type: TextInputType.phone),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Mobile",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: MobileCont,
                            hintText: 'Your Mobile',
                            type: TextInputType.phone),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "WebSite",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFiled(
                            controller: WebsiteCont!, hintText: 'Your Website'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Industry",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFiled(
                            controller: IndustryCont!,
                            hintText: 'Your Industry'),
                        const SizedBox(
                          height: 24,
                        ),
                      Text(
                          "Region",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
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
                                  StylesData.font12.copyWith(color: kMainColor),
                              dropdownSearchDecoration: InputDecoration(
                                suffixIconColor: Colors.grey[300],
                                hintText: 'Choose Region',
                                hintStyle: StylesData.font14
                                    .copyWith(color: const Color(0x330D223F)),
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
                                    suffixIconColor: Colors.grey[300],

                                    hintText: "Choose Region",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: kMainColor),
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
                              regionItem = i;
                              print(i);
                            },
                            items: AddLeadCubit.get(context).regionList,
                            enabled: true,
                            selectedItem: regionItem,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Note",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFiled(
                            controller: NoteCont!,
                            hintText: 'Write Note',
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
                              if (formKey.currentState!.validate()) {
                                print(statusValue);
                                print("object");
                                if (Source != null) {
                                  AddLeadCubit.get(context).addNewLeeds(
                                      id: int.parse(
                                          widget.editModel.id.toString()),
                                      country: '',
                                      website: WebsiteCont?.text ?? '',
                                      leadName: NameCont?.text ?? '',
                                      status: statusValue != null
                                          ? int.parse(statusValue!)
                                          : 0,
                                      owner: int.parse(owener!),
                                      source: Source != null
                                          ? int.parse(Source!)
                                          : 0,
                                      address: AddressCont?.text ?? '',
                                      city: '',
                                      state: '',
                                      zip: '',
                                      currency: '',
                                      phone: PhoneCont?.text ?? '',
                                      mobile: MobileCont?.text ?? '',
                                      industry: IndustryCont?.text ?? '',
                                      region: regionItem ?? '',
                                      note: NoteCont?.text ?? '');
                                } else {
                                  setState(() {
                                    isEmpty = true;
                                  });
                                }
                              }
                            },
                            textWidget: Center(
                              child: state is CreatnewLeadLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Edit Lead',
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
                            ),
                            c: kMainColor)
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is GetLeadStatusEroor) {
              return Center(
                child: Text(state.errorText),
              );
            } else if (state is GetSourceEroor) {
              return Center(
                child: Text(state.errorText),
              );
            } else if (state is GetOwnerEroor) {
              return Center(
                child: Text(state.errorText),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          listener: (BuildContext context, AddLeadState state) {
            if (state is CreatnewLeadSucc) {
              Nav(
                  context,
                  LeedsDetiles(
                    id: state.id,
                  ));
            }
            if (state is CreatnewLeadEroor) {
              Fluttertoast.showToast(
                  msg: state.errorText.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 18.0);
            }
          },
        ),
      ),
    );
  }
}
