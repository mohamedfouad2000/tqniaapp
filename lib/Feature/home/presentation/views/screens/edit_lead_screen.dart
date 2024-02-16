import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';
import 'package:tqniaapp/Feature/home/data/model/owener_model/owener_model.dart';
import 'package:tqniaapp/Feature/home/data/model/source_model/source_model.dart';
import 'package:tqniaapp/Feature/home/data/model/status_model/status_model.dart';
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

class _EditLeadScreenState extends State<EditLeadScreen> {
  TextEditingController NameCont = TextEditingController();
  TextEditingController StatusCont = TextEditingController();
  TextEditingController OwnerCont = TextEditingController();
  TextEditingController SourceCont = TextEditingController();
  TextEditingController AddressCont = TextEditingController();
  TextEditingController CityCont = TextEditingController();
  TextEditingController StateCont = TextEditingController();
  TextEditingController ZipCont = TextEditingController();
  TextEditingController CountryCont = TextEditingController();
  TextEditingController PhoneCont = TextEditingController();
  TextEditingController MobileCont = TextEditingController();
  TextEditingController WebsiteCont = TextEditingController();
  TextEditingController IndustryCont = TextEditingController();
  TextEditingController NoteCont = TextEditingController();
  var formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    Currencyitem = widget.editModel.currency.toString();
    NameCont.text = widget.editModel.companyName.toString();
    statusValue = widget.editModel.leadStatusId;
    owener = widget.editModel.ownerId.toString();
    Source = widget.editModel.leadSourceId.toString();
    SourceCont.text = widget.editModel.leadSourceId.toString();
    AddressCont.text = widget.editModel.address.toString();
    CityCont.text = widget.editModel.city.toString();
    StateCont.text = widget.editModel.state.toString();
    ZipCont.text = widget.editModel.zip.toString();
    CountryCont.text = widget.editModel.country.toString();
    PhoneCont.text = widget.editModel.phone.toString();
    MobileCont.text = widget.editModel.vatNumber.toString();
    WebsiteCont.text = widget.editModel.website.toString();
    IndustryCont.text = widget.editModel.currency.toString();
    NoteCont.text = widget.editModel.note.toString();

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
          ..getLeadSources(),
        child: BlocConsumer<AddLeadCubit, AddLeadState>(
          builder: (context, state) {
            if (AddLeadCubit.get(context).sourceModel.isNotEmpty &&
                AddLeadCubit.get(context).statusModel.isNotEmpty &&
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
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
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
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
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
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: AddressCont,
                            hintText: 'Write Your Address'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "City",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: CityCont, hintText: 'Your City'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "State",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: StateCont, hintText: 'Your State'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Zip",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: ZipCont,
                            hintText: 'Your Zip',
                            type: TextInputType.number),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Country",
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFormedFiled(
                            controller: CountryCont, hintText: 'Your Country'),
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
                        customTextFormedFiled(
                            controller: WebsiteCont, hintText: 'Your Website'),
                        const SizedBox(
                          height: 24,
                        ),
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
                        customTextFormedFiled(
                            controller: IndustryCont,
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
                          style:
                              StylesData.font16.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customTextFiled(
                            controller: NoteCont,
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
                                      country: CountryCont.text,
                                      website: WebsiteCont.text,
                                      id: int.parse(
                                          widget.editModel.id.toString()),
                                      leadName: NameCont.text,
                                      status: int.parse(statusValue!),
                                      owner: int.parse(owener!),
                                      source: int.parse(Source!),
                                      address: AddressCont.text,
                                      city: CityCont.text,
                                      state: StateCont.text,
                                      zip: ZipCont.text,
                                      currency: Currencyitem!,
                                      phone: PhoneCont.text,
                                      mobile: MobileCont.text,
                                      industry: IndustryCont.text,
                                      region: Currencyitem!,
                                      note: NoteCont.text);
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
