import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/empty_notes.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_note_repo/add_note_repo_impl.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/note/note_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/note/note_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/edit_note_screen.dart';

// ignore: must_be_immutable
class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  var searchCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(AddNoteRepoImp())..getNotes(title: ''),
      child: BlocConsumer<NoteCubit, NoteState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          // NoteCubit.get(context).getNotes(
                          //   title: searchCont.text

                          //  );
                        },
                        icon: const Icon(Icons.filter_list)),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: customTextFiled(
                          onChanged: (String i) {
                            searchCont.text = i;
                            NoteCubit.get(context)
                                .getNotes(title: searchCont.text);
                          },
                          controller: searchCont,
                          hintText: 'search'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Builder(builder: (context) {
                  if (state is GetNotesSucc) {
                    if (state.model.data!.notes!.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child:SingleChildScrollView (
                            child: EmptyNotesWidget(),
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            sortAscending: true,
                            columnSpacing: 16.0,
                            dataRowMaxHeight: double.infinity,
                            dataRowMinHeight: 71,
                            dividerThickness: 1,
                            border: TableBorder(
                              horizontalInside:
                                  BorderSide(color: kbackColor, width: 20),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            dataRowColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return kMainColor;
                              }
                              return null; // Use the default value.
                            }),
                            columns: [
                              DataColumnItem(txt: 'Created Date'),
                              DataColumnItem(txt: 'Title'),
                              DataColumnItem(txt: 'Files'),
                              DataColumnItem(txt: 'Action'),
                            ],
                            rows: List<DataRow>.generate(
                              state.model.data?.notes?.length ?? 0,
                              (index) {
                                final item = state.model.data?.notes?[index];

                                return DataRow(
                                    // color: MaterialStateProperty.resolveWith(getColor),
                                    cells: [
                                      DataCell(
                                        SizedBox(
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                              item?.createdAt ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: StylesData.font12.copyWith(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              item?.title ?? '',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: StylesData.font12.copyWith(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Container(
                                          width: 150,
                                          height: 43,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFEAEAEA)),
                                              borderRadius:
                                                  BorderRadius.circular(58),
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              urlLauncherFunc(
                                                  url:
                                                      '$showFile${item.files?[0].toString().split('/').last}');
                                              // if (await canLaunch(
                                              //     '$showFile${item.files?[0].toString().split('/').last}')) {
                                              //   await launch(
                                              //       '$showFile${item.files?[0].toString().split('/').last}');
                                              // } else {
                                              //   throw 'Could not launch Pdf';
                                              // }
                                            },
                                            child: Row(
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    const Image(
                                                      image: AssetImage(
                                                        AssetsData.pdffile,
                                                      ),
                                                      height: 27,
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      'PDF',
                                                      style: StylesData.font10
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 6),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    item!.files!.isEmpty
                                                        ? ''
                                                        : item.files![0]
                                                            .toString()
                                                            .split('/')
                                                            .last,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.rubik(
                                                        textStyle:
                                                            const TextStyle(
                                                      color: Color(0xFF0D223F),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(Center(
                                        child: InkWell(
                                          onTap: () {
                                            NavegatorPush(
                                                context,
                                                EditNoteScreen(
                                                  model: item,
                                                ));
                                          },
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 22,
                                                backgroundColor:
                                                    Colors.grey.withOpacity(.3),
                                              ),
                                              const CircleAvatar(
                                                radius: 21,
                                                backgroundColor: Colors.white,
                                                child: Center(
                                                  child: Image(
                                                    image: AssetImage(
                                                      AssetsData.edit2,
                                                    ),
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ]);
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (state is GetNotesFail) {
                    return const FailureWidget();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ],
            ),
          );
        },
        listener: (BuildContext context, NoteState state) {},
      ),
    );
  }

  DataColumn DataColumnItem({required String txt}) {
    return DataColumn(
      label: Container(
        width: 150,
        height: 42,
        decoration: ShapeDecoration(
          color: const Color(0x33E92929),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            txt,
            style: StylesData.font12.copyWith(color: const Color(0xFFE92929)),
          ),
        ),
      ),
    );
  }

  List<dynamic> data = [
    {
      "Created Date": "5/7/16",
      "Title": 'Title',
      "Files": "Jamet kudasi - CV..",
      'Action': 'Action',
    },
  ];
}
