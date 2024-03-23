import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Core/widgets/empty_calls.dart';
import 'package:tqniaapp/Core/widgets/faliure_wid.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_calls_repo/add_calls_repo_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/edit_calls_form.dart';

class CallesScreen extends StatefulWidget {
  const CallesScreen({super.key});

  @override
  State<CallesScreen> createState() => _CallesScreenState();
}

class _CallesScreenState extends State<CallesScreen> {
  List<String> statusList = [
    'Answered',
    'No answer',
    'Busy',
    'Not available',
    'Wrong number'
  ];
  String? statusItem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddCallsCubit(AddCallsRepoImp())..getCalls(status: ''),
      child: BlocConsumer<AddCallsCubit, AddCallsState>(
          listener: (context, state) {},
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
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list)),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
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
                              value: statusItem,
                              borderRadius: BorderRadius.circular(10),
                              isDense: true,
                              isExpanded: true,
                              //elevation: 5,
                              style: StylesData.font14
                                  .copyWith(color: Colors.black),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey.withOpacity(.4),
                              ),

                              items: [
                                const DropdownMenuItem<String>(
                                  value: '',
                                  child: Text("status"),
                                ),
                                ...statusList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                })
                              ],
                              hint: const Text(
                                "status",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  statusItem = value;
                                  print(statusItem);
                                });
                                AddCallsCubit.get(context)
                                    .getCalls(status: statusItem ?? '');
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                  Builder(builder: (context) {
                    if (state is GetCallsSucc) {
                      if (state.model.data!.calls!.isEmpty) {
                        return const Expanded(
                          child: Center(
                            child: EmptyCallsWidget(),
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
                                DataColumnItem(txt: 'State'),
                                DataColumnItem(txt: 'Note'),
                                DataColumnItem(txt: 'description'),
                                DataColumnItem(txt: 'Created date'),
                                DataColumnItem(txt: 'Action'),
                              ],
                              rows: List<DataRow>.generate(
                                state.model.data!.calls!.length,
                                (index) {
                                  final item = state.model.data!.calls![index];
                                  return DataRow(
                                      // color: MaterialStateProperty.resolveWith(getColor),
                                      cells: [
                                        DataCell(
                                          Center(
                                            child: SizedBox(
                                              width: 150,
                                              child: Text(
                                                item.status ?? '',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: StylesData.font12
                                                    .copyWith(
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
                                                item.notes.toString(),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: StylesData.font12
                                                    .copyWith(
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
                                                item.description ?? '',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: StylesData.font12
                                                    .copyWith(
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
                                                item.createdAt ?? '',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: StylesData.font12
                                                    .copyWith(
                                                        color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(Center(
                                          child: InkWell(
                                            onTap: () {
                                              NavegatorPush(context,
                                                  EditCallsForm(model: item));
                                            },
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 22,
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(.3),
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
                    } else if (state is GetCallsfail) {
                      return const Expanded(child: FailureWidget());
                    } else {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }),
                ],
              ),
            );
          }),
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
      "State": "Answered",
      "Note": 'Test',
      "Created date": "Test",
      'Action': 'Action',
    },
  ];
}
