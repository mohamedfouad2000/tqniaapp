import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

class MonthWidget extends StatefulWidget {
  const MonthWidget({super.key});

  @override
  State<MonthWidget> createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  int currentindex = 2;
  var x = DateFormat('MMMM').format(
    DateTime.now(),
  );
  var now = DateTime.now();
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  @override
  void initState() {
    for (int i = 0; i < months.length; i++) {
      if (x.toString() == months[i]) {
        currentindex = i;
        break;
      }
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (currentindex == 0) {
              setState(() {
                currentindex = 11;
              });
            } else {
              setState(() {
                currentindex--;
              });
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        const Spacer(),
        Text(
          months[currentindex],
          style: StylesData.font20.copyWith(color: Colors.black),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            if (currentindex == 11) {
              setState(() {
                currentindex = 0;
              });
            } else {
              setState(() {
                currentindex++;
              });
            }
          },
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ),
      ],
    );
  }
}
