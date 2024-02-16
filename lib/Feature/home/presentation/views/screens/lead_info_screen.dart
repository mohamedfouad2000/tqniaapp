import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Core/widgets/line_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Leads%20Info/leads_info_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Leads%20Info/leads_info_state.dart';

class LeadInfoScreen extends StatelessWidget {
  const LeadInfoScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeadsInfoCubit(HomeRepoImp())..getLeadById(id: id),
      child: BlocConsumer<LeadsInfoCubit, LeadsInfoState>(
        builder: (context, state) {
          if (state is getLeadByIdSucc) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.profile,
                        txt1: "Lead name",
                        image2: AssetsData.status,
                        txt2: "Status"),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                        txt1: state.model.companyName ?? '',
                        txt2: state.model.leadStatusTitle ?? '',
                        color: state.model.leadStatusColor ?? '',
                        nottext: true),
                    const SizedBox(
                      height: 30,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.profile,
                        txt1: "Owner",
                        image2: AssetsData.source,
                        txt2: "Source"),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                        txt1: state.model.ownerName ?? '',
                        txt2: state.model.leadSourceId ?? '',
                        color: state.model.leadStatusColor ?? '',
                        nottext: true),
                    const SizedBox(
                      height: 30,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.address,
                        txt1: "Address",
                        image2: AssetsData.city,
                        txt2: "City"),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                        txt1: state.model.address ?? '',
                        txt2: state.model.city ?? ''),
                    const SizedBox(
                      height: 24,
                    ),
                    const LineWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.map,
                        txt1: "State",
                        image2: AssetsData.zip,
                        txt2: "ZIP"),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                      txt1: state.model.state ?? '',
                      txt2: state.model.zip ?? '',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.country,
                        txt1: "Country",
                        image2: AssetsData.phone,
                        txt2: "Phone"),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                      txt1: state.model.country ?? '',
                      txt2: state.model.phone ?? '',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.mobile,
                        txt1: "Mobile",
                        image2: AssetsData.website,
                        txt2: "Website"),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                      txt1: state.model.vatNumber ?? '',
                      txt2: state.model.website ?? '',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const LineWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.indust,
                        txt1: "Industry",
                        image2: AssetsData.city,
                        txt2: "Region"),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                      txt1: state.model.currency ?? '',
                      txt2: state.model.country ?? '',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.status,
                        txt1: "Notes",
                        image2: '',
                        txt2: ""),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                      txt1: state.model.note ?? '',
                      txt2: '',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is getLeadByIdfalilure) {
            return const FailureWidget();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        listener: (BuildContext context, LeadsInfoState state) {},
      ),
    );
  }

  Row leadHeadertitle({
    required String image1,
    required String txt1,
    required String image2,
    required String txt2,
  }) {
    return Row(
      children: [
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: AssetImage(image1), width: 24, height: 24),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 100,
                child: Text(
                  txt1,
                  overflow: TextOverflow.fade,
                  style: StylesData.font16.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (image2 != '')
                Image(image: AssetImage(image2), width: 24, height: 24),
              const SizedBox(
                width: 8,
              ),
              Text(
                txt2,
                style: StylesData.font16.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row leadHeadersubtitle(
      {required String txt1,
      required String txt2,
      bool nottext = false,
      String color = ''}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            txt1,
            style: StylesData.font12.copyWith(color: const Color(0xFFA29EB6)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        nottext
            ? Flexible(
                child: Container(
                  width: 83,
                  height: 30,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: ShapeDecoration(
                    color: colorHex(color),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      txt2,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              )
            : Flexible(
                child: Text(
                  txt2,
                  style: StylesData.font12
                      .copyWith(color: const Color(0xFFA29EB6)),
                ),
              ),
      ],
    );
  }
}
