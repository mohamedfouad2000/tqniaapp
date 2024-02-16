import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/add_lead_form.dart';

class LeadsEmptyWidget extends StatelessWidget {
  const LeadsEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage(AssetsData.emptyLeed),
          height: 197,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Leads Not found",
          style: StylesData.font14.copyWith(
            color: const Color(0xFF070417),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        defaultButton(
            fun: () {
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
            textWidget: Text(
              'Add new Lead',
              style: StylesData.font14,
            ),
            c: kMainColor,
            height: 63),
      ],
    );
  }
}
