import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/widgets/custom_loading_widget.dart';
import 'package:tqniaapp/Core/widgets/loading/home_lead_loading.dart';

import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leads_widget.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leed_full_widget.dart';

class HomeLeads extends StatelessWidget {
  const HomeLeads({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowLeadsCubit(HomeRepoImp())
        ..getHomeLeads(date: '', source: '', status: '', search: ''),
      child: BlocConsumer<ShowLeadsCubit, ShowLeadsState>(
        listener: (context, state) {
          {}
          if (state is ShowLeadsfailure) {
            print(state.errormsq.toString());
          }
        },
        builder: (context, state) {
          if (state is ShowLeadssucc) {
            if (state.model.data!.leads!.isNotEmpty) {
              return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      LeedFullWidget(model: state.model.data!.leads![index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: state.model.data!.leads!.length >= 3
                      ? 3
                      : state.model.data!.leads!.length);
            } else {
              return const LeadsEmptyWidget();
            }
          } else if (state is ShowLeadsfailure) {
            return Center(
              child: Text(state.errormsq),
            );
          } else {
            return const CustomLoadingWidget(child: HomeLeadLoading());
          }
        },
      ),
    );
  }
}
