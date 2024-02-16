import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';

import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/owener_model/owener_model.dart';
import 'package:tqniaapp/Feature/home/data/model/source_model/source_model.dart';
import 'package:tqniaapp/Feature/home/data/model/status_model/status_model.dart';

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
  final TextEditingController NameCont;
  final TextEditingController StatusCont;
  final TextEditingController OwnerCont;
  final TextEditingController SourceCont;
  final TextEditingController AddressCont;
  final TextEditingController CityCont;
  final TextEditingController StateCont;
  final TextEditingController ZipCont;
  final TextEditingController CountryCont;
  final TextEditingController PhoneCont;
  final TextEditingController MobileCont;
  final TextEditingController WebsiteCont;
  final TextEditingController IndustryCont;
  final TextEditingController NoteCont;

  @override
  State<AddLeedForm> createState() => _AddLeedFormState();
}

class _AddLeedFormState extends State<AddLeedForm> {
  List<String> Currency = [
    "AED",
    "AFN",
    "ALL",
    "AMD",
    "ANG",
    "AOA",
    "ARS",
    "AUD",
    "AWG",
    "AZN",
    "BAM",
    "BBD",
    "BDT",
    "BGN",
    "BHD",
    "BIF",
    "BMD",
    "BND",
    "BOB",
    "BOV",
    "BRL",
    "BSD",
    "BTN",
    "BWP",
    "BYR",
    "BZD",
    "CAD",
    "CDF",
    "CHE",
    "CHF",
    "CHW",
    "CLF",
    "CLP",
    "CNY",
    "COP",
    "COU",
    "CRC",
    "CUC",
    "CUP",
    "CVE",
    "CZK",
    "DJF",
    "DKK",
    "DOP",
    "DZD",
    "EGP",
    "ERN",
    "ETB",
    "EUR",
    "FJD",
    "FKP",
    "GBP",
    "GEL",
    "GHS",
    "GIP",
    "GMD",
    "GNF",
    "GTQ",
    "GYD",
    "HKD",
    "HNL",
    "HRK",
    "HTG",
    "HUF",
    "IDR",
    "ILS",
    "INR",
    "IQD",
    "IRR",
    "ISK",
    "JMD",
    "JOD",
    "JPY",
    "KES",
    "KGS",
    "KHR",
    "KMF",
    "KPW",
    "KRW",
    "KWD",
    "KYD",
    "KZT",
    "LAK",
    "LBP",
    "LKR",
    "LRD",
    "LSL",
    "LYD",
    "MAD",
    "MDL",
    "MGA",
    "MKD",
    "MMK",
    "MNT",
    "MOP",
    "MRO",
    "MUR",
    "MVR",
    "MWK",
    "MXN",
    "MXV",
    "MYR",
    "MZN",
    "NAD",
    "NGN",
    "NIO",
    "NOK",
    "NPR",
    "NZD",
    "OMR",
    "PAB",
    "PEN",
    "PGK",
    "PHP",
    "PKR",
    "PLN",
    "PYG",
    "QAR",
    "RON",
    "RSD",
    "RUB",
    "RWF",
    "SAR",
    "SBD",
    "SCR",
    "SDG",
    "SEK",
    "SGD",
    "SHP",
    "SLL",
    "SOS",
    "SRD",
    "SSP",
    "STD",
    "SYP",
    "SZL",
    "THB",
    "TJS",
    "TMT",
    "TND",
    "TOP",
    "TRY",
    "TTD",
    "TWD",
    "TZS",
    "UAH",
    "UGX",
    "USD",
    "USN",
    "USS",
    "UYI",
    "UYU",
    "UZS",
    "VEF",
    "VND",
    "VUV",
    "WST",
    "XAF",
    "XAG",
    "XAU",
    "XBA",
    "XBB",
    "XBC",
    "XBD",
    "XCD",
    "XDR",
    "XFU",
    "XOF",
    "XPD",
    "XPF",
    "XPT",
    "XSU",
    "XTS",
    "XUA",
    "YER",
    "ZAR",
    "ZMW"
  ];

  String? statusValue;

  String? Source;
  String? Currencyitem;
  String? owener;
  bool isEmpty = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddLeadCubit(HomeRepoImp())
          ..getOwners()
          ..getLeadStatus()
          ..getLeadSources(),
        child: BlocConsumer<AddLeadCubit, AddLeadState>(
          builder: (context, state) {
            if (AddLeadCubit.get(context).sourceModel.isNotEmpty &&
                AddLeadCubit.get(context).statusModel.isNotEmpty &&
                AddLeadCubit.get(context).ownerModel.isNotEmpty) {
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
                        "Status",
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
                            value: statusValue,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Choose Status',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // stateId =
                              setState(() {
                                print(value);
                                statusValue = value.toString();
                              });
                            },
                            items: AddLeadCubit.get(context)
                                .statusModel
                                .map<DropdownMenuItem<String>>(
                                    (StatusModel? value) {
                              return DropdownMenuItem<String>(
                                value: value?.id.toString(),
                                child: Text(value?.title.toString() ?? ''),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
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
                            value: owener,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Choose Owner',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              print(value);
                              setState(() {
                                owener = value!;
                              });
                            },
                            items: AddLeadCubit.get(context)
                                .ownerModel
                                .map<DropdownMenuItem<String>>(
                                    (OwenerModel value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.name!),
                              );
                            }).toList(),
                          ),
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
                            value: Source,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Choose Source',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                Source = value!;
                              });
                            },
                            items: AddLeadCubit.get(context)
                                .sourceModel
                                .map<DropdownMenuItem<String>>(
                                    (SourceModel value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.title!),
                              );
                            }).toList(),
                          ),
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
                      customTextFormedFiled(
                          controller: widget.AddressCont,
                          hintText: 'Write Your Address'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "City",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFormedFiled(
                          controller: widget.CityCont, hintText: 'Your City'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "State",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFormedFiled(
                          controller: widget.StateCont, hintText: 'Your State'),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Zip",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFormedFiled(
                          controller: widget.ZipCont,
                          hintText: 'Your Zip',
                          type: TextInputType.number),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Country",
                        style: StylesData.font16.copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      customTextFormedFiled(
                          controller: widget.CountryCont,
                          hintText: 'Your Country'),
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
                      customTextFormedFiled(
                          controller: widget.WebsiteCont,
                          hintText: 'Your Website'),
                      const SizedBox(
                        height: 24,
                      ),
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
                      customTextFormedFiled(
                          controller: widget.IndustryCont,
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
                            value: Currencyitem,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Colors.grey.withOpacity(.4),
                            ),
                            hint: Text(
                              'Choose Region',
                              style: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                            ),
                            style:
                                StylesData.font14.copyWith(color: kMainColor),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                Currencyitem = value ?? '';
                              });
                            },
                            items: Currency.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
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
                          controller: widget.NoteCont,
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
                              if (Source != null &&
                                  statusValue != null &&
                                  Currencyitem != null &&
                                  owener != null) {
                                AddLeadCubit.get(context).addNewLeeds(
                                    country: widget.CountryCont.text,
                                    website: widget.WebsiteCont.text,
                                    leadName: widget.NameCont.text,
                                    status: int.parse(statusValue!),
                                    owner: int.parse(owener!),
                                    source: int.parse(Source!),
                                    address: widget.AddressCont.text,
                                    city: widget.CityCont.text,
                                    state: widget.StateCont.text,
                                    zip: widget.ZipCont.text,
                                    currency: Currencyitem!,
                                    phone: widget.PhoneCont.text,
                                    mobile: widget.MobileCont.text,
                                    industry: widget.IndustryCont.text,
                                    region: Currencyitem!,
                                    note: widget.NoteCont.text);
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
