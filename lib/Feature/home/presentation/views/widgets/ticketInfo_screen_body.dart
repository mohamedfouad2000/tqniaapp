import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/widgets/pdf_view_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/line_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_state.dart';
class TicketInfoScreenBody extends StatelessWidget {
  const TicketInfoScreenBody({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    TextEditingController discController = TextEditingController();
    return BlocProvider(
      create: (context) =>
          AddticketCubit(AddTicketRepoImpl())..getTicketById(id: id),
      child: BlocConsumer<AddticketCubit, AddticketState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetticketByIdSucc) {
            print(state.model.data?.ticket?.labels);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    leadHeadertitle(
                      image1: AssetsData.profile,
                      txt1: 'Title',
                      image2: '',
                      txt2: '',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                        txt1: state.model.data?.main?.title ?? '', txt2: ''),
                    const SizedBox(
                      height: 30,
                    ),
                    leadHeadertitle(
                      image1: AssetsData.profile,
                      txt1: 'Requested by',
                      image2: AssetsData.document,
                      txt2: 'Ticket Type',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                        txt1: state.model.data?.main?.requestedBy ?? '',
                        txt2: state.model.data?.ticket?.ticketType ?? '',
                        nottext: true),
                    const SizedBox(
                      height: 30,
                    ),
                    leadHeadertitle(
                      image1: AssetsData.briefcase,
                      txt1: 'Client',
                      image2: AssetsData.profile,
                      txt2: 'Assigned to',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    leadHeadersubtitle(
                      txt1: state.model.data?.ticket?.client ?? '',
                      txt2: state.model.data?.ticket?.assignedToName ?? '',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const LineWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    leadHeadertitle(
                      image1: AssetsData.graph,
                      txt1: 'Description',
                      image2: '',
                      txt2: '',
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      width: double.infinity,
                      height: 113,
                      padding: const EdgeInsets.only(
                        top: 13.76,
                        left: 17,
                        right: 17,
                        bottom: 13.24,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFEAEAEA)),
                          borderRadius: BorderRadius.circular(18.35),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                            state.model.data?.comments?[0].description ?? ''),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const LineWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.medal,
                        txt1: 'Label',
                        image2: AssetsData.calendar,
                        txt2: 'Created'),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 83,
                                height: 30,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: ShapeDecoration(
                                  color: const Color(0x19640CBC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    state.model.data!.ticket!.labels!.isNotEmpty
                                        ? (state.model.data?.ticket?.labels?[0]
                                                .text ??
                                            '')
                                        : '',
                                    style: GoogleFonts.rubik(
                                        textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.indigoAccent,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            state.model.data?.main?.createdAt != null
                                ? state.model.data?.main?.createdAt
                                        .toString()
                                        .split(' ')
                                        .first ??
                                    ''
                                : '',
                            style: StylesData.font12
                                .copyWith(color: const Color(0xFFA29EB6)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    leadHeadertitle(
                        image1: AssetsData.folder,
                        txt1: 'Files',
                        image2: '',
                        txt2: ''),
                    const SizedBox(
                      height: 13,
                    ),
                    InkWell(
                      onTap: () async {
                        print(state.model.data?.comments?[0].files?[0]
                            .toString()
                            .split('/')
                            .last
                            .toString()
                            .split('.')
                            .last
                            .toString());
                        if (state.model.data?.comments![0].files?[0]
                                .toString()
                                .split('/')
                                .last
                                .toString()
                                .split('.')
                                .last
                                .toString() ==
                            'pdf') {
                          try {
                            NavegatorPush(
                                context,
                                PdfViewWidget(
                                    link:
                                        '$showFile${state.model.data?.comments?[0].files?[0].toString().split('/').last}'));
                          } catch (e) {
                            urlLauncherFunc(
                                url:
                                    '$showFile${state.model.data!.comments?[0].files?[0].toString().split('/').last}');
                          }
                        } else {
                          urlLauncherFunc(
                              url:
                                  '$showFile${state.model.data?.comments?[0].files?[0].toString().split('/').last}');
                        }

                        // ignore: deprecated_member_use
                        // if (await canLaunch(
                        //     '$showFile${state.model.data!.comments![0].files?[0].toString().split('/').last}')) {
                        //   // ignore: deprecated_member_use
                        //   await launch(
                        //       '$showFile${state.model.data!.comments![0].files?[0].toString().split('/').last}');
                        // } else {
                        //   throw 'Could not launch Pdf';
                        // }
                      },
                      child: Container(
                        width: double.infinity,
                        // height: 70.82,
                        padding: const EdgeInsets.all(15.92),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEAECF0)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15.5,
                              backgroundColor: kbackColor,
                              backgroundImage: const AssetImage(AssetsData.pdf),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.model.data?.comments?[0].files
                                                .toString() !=
                                            '[]'
                                        ? state.model.data!.comments![0].files
                                            .toString()
                                            .split('/')
                                            .last
                                        : '',
                                    maxLines: 1,
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                      color: Color(0xFF101828),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.94,
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    state.model.data?.comments?[0].files
                                                .toString() !=
                                            '[]'
                                        ? '200KB'
                                        : '',
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                      color: Color(0xFF667085),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9.95,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 31,
                              padding: const EdgeInsets.only(
                                top: 9.53,
                                left: 8.80,
                                right: 9.26,
                                bottom: 9.53,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFEAECF0)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.remove_red_eye,
                                size: 11,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    customTextFiled(
                        controller: discController, hintText: 'write comment'),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                        onPressed: () {
                          AddticketCubit.get(context)
                              .addCommentToTicket(
                                  id: id, description: discController.text)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Add Comment"))
                  ],
                ),
              ),
            );
          } else if (state is GetticketByIdFailuire) {
            return Center(
              child: Text(state.errorMsq.toString()),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
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
                width: 120,
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

  Row leadHeadersubtitle({
    required String txt1,
    required String txt2,
    bool nottext = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    color: const Color(0x19FF0000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      txt2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF0000),
                      )),
                    ),
                  ),
                ),
              )
            : Flexible(
                child: Text(
                  txt2,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: StylesData.font12
                      .copyWith(color: const Color(0xFFA29EB6)),
                ),
              ),
      ],
    );
  }
}
