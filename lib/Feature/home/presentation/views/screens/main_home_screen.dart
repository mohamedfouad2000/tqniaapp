import 'package:flutter/material.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/clock_in_out_widget.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/custom_main_home_Appbar.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/home_leads.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leads_header_widget.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/meeting_full_card.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  bool isEmpty = true;
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomMainHomePageAppBar(),
            const SizedBox(
              height: 32,
            ),
            const ClockInOut(),
            const SizedBox(
              height: 32,
            ),
            MettingFullCard(pageController: pageController),
            const SizedBox(
              height: 32,
            ),
            const LeadsHeaderWidget(),
            const SizedBox(
              height: 25,
            ),
            const HomeLeads(),
          ],
        ),
      ),
    );
  }
}
