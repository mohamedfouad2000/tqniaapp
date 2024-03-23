import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/colors.dart';

import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/add_lead_form.dart';

class CustomLeedAppBar extends StatelessWidget {
  const CustomLeedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Leads",
          style: StylesData.font18.copyWith(color: const Color(0xFF040415)),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
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
            showModalBottomSheet(
              // enableDrag: true,
              // isDismissible: true,
              useSafeArea: true,
              showDragHandle: true,
              elevation: 0.0,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: AddLeedForm(
                      NameCont: NameCont,
                      StatusCont: StatusCont,
                      OwnerCont: OwnerCont,
                      SourceCont: SourceCont,
                      AddressCont: AddressCont,
                      CityCont: CityCont,
                      StateCont: StateCont,
                      ZipCont: ZipCont,
                      CountryCont: CountryCont,
                      PhoneCont: PhoneCont,
                      MobileCont: MobileCont,
                      WebsiteCont: WebsiteCont,
                      IndustryCont: IndustryCont,
                      NoteCont: NoteCont),
                );
              },
            );
            // NavegatorPush(context, const NotificationScreen());
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 29,
                backgroundColor: const Color(0xFF040415).withOpacity(0.10),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: kMainColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
