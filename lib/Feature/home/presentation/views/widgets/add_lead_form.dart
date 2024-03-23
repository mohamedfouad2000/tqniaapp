import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/AddLead/add_lead_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/AddLead/add_lead_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/leads_deatils_screen.dart';

class AddLeedForm extends StatefulWidget {
  const AddLeedForm({
    super.key,
    required this.NameCont,
    required this.StatusCont,
    required this.OwnerCont,
    required this.SourceCont,
    required this.AddressCont,
    required this.CityCont,
    required this.StateCont,
    required this.ZipCont,
    required this.CountryCont,
    required this.PhoneCont,
    required this.MobileCont,
    required this.WebsiteCont,
    required this.IndustryCont,
    required this.NoteCont,
  });
  final TextEditingController? NameCont;
  final TextEditingController? StatusCont;
  final TextEditingController? OwnerCont;
  final TextEditingController? SourceCont;
  final TextEditingController? AddressCont;
  final TextEditingController? CityCont;
  final TextEditingController? StateCont;
  final TextEditingController? ZipCont;
  final TextEditingController? CountryCont;
  final TextEditingController? PhoneCont;
  final TextEditingController? MobileCont;
  final TextEditingController? WebsiteCont;
  final TextEditingController? IndustryCont;
  final TextEditingController? NoteCont;

  @override
  State<AddLeedForm> createState() => _AddLeedFormState();
}

class _AddLeedFormState extends State<AddLeedForm> {
  String? Source;
  String? status;
  bool isEmpty = false;

  String? owener;
  String? regionItem;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    owener = USERID;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddLeadCubit(HomeRepoImp())
          ..getOwners()
          ..getLeadSources()
          ..getLeadStatus()
          ..getRegion(),
        child: BlocConsumer<AddLeadCubit, AddLeadState>(
          builder: (context, state) {
            if (AddLeadCubit.get(context).sourceModel.isNotEmpty &&
                AddLeadCubit.get(context).statusModel.isNotEmpty &&
                AddLeadCubit.get(context).ownerModel.isNotEmpty &&
                AddLeadCubit.get(context).regionList.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        "Create Leed",
                        style: StylesData.font20,
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Leed Name",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFormedFiled(
                          controller: widget.NameCont, hintText: 'Name'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Owner",
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
                                StylesData.font12.copyWith(color: kMainColor),
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
                        "Status",
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
                                StylesData.font12.copyWith(color: kMainColor),
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
                            status = i;
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
                          selectedItem: status,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Source",
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
                                StylesData.font12.copyWith(color: kMainColor),
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
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFiled(
                          controller: widget.AddressCont!,
                          hintText: 'Write Your Address'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Phone",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFormedFiled(
                          controller: widget.PhoneCont,
                          hintText: 'Your Phone',
                          type: TextInputType.phone),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Mobile",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFormedFiled(
                          controller: widget.MobileCont,
                          hintText: 'Your Mobile',
                          type: TextInputType.phone),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "WebSite",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFiled(
                          controller: widget.WebsiteCont!,
                          hintText: 'Your Website'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Industry",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFiled(
                          controller: widget.IndustryCont!,
                          hintText: 'Your Industry'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Region",
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
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFiled(
                          controller: widget.NoteCont!,
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
                              print(status);
                              print("object");
                              if (Source != null) {
                                AddLeadCubit.get(context).addNewLeeds(
                                    country: '',
                                    currency: '',
                                    website: widget.WebsiteCont?.text ?? '',
                                    leadName: widget.NameCont?.text ?? '',
                                    status:
                                        status != null ? int.parse(status!) : 0,
                                    owner: int.parse(owener!),
                                    source:
                                        Source != null ? int.parse(Source!) : 0,
                                    address: widget.AddressCont?.text ?? '',
                                    city: '',
                                    state: widget.StateCont?.text ?? '',
                                    zip: '',
                                    phone: widget.PhoneCont?.text ?? '',
                                    mobile: widget.MobileCont?.text ?? '',
                                    industry: widget.IndustryCont?.text ?? '',
                                    region: regionItem ?? '',
                                    note: widget.NoteCont?.text ?? '');
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add new Lead',
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
              NavegatorPush(
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
        ));
  }
}
