import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/screens/view_all_leads.dart';

class LeadsHeaderWidget extends StatelessWidget {
  const LeadsHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "New Leads",
          style: StylesData.font16.copyWith(color: const Color(0xFF070417)),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            NavegatorPush(context, const ViewAllLeadsScreen());
          },
          child: Text("View All",
              style: StylesData.font12.copyWith(color: kMainColor)),
        )
      ],
    );
  }
}
