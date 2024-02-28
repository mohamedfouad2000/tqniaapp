import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leads_widget.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leed_full_widget.dart';

class ViewAllLeadsScreen extends StatelessWidget {
  const ViewAllLeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowLeadsCubit(HomeRepoImp())..getHomeLeads(date: '',source: '',status: '',search: ''),
      child: BlocConsumer<ShowLeadsCubit, ShowLeadsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('All Leads'),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    if (state is ShowLeadssucc) {
                      if (state.model.data!.leads!.isNotEmpty) {
                        return ListView.separated(
                            // physics: const NeverScrollableScrollPhysics(),          shrinkWrap: true,

                            itemBuilder: (context, index) {
                              print(index);
                              print(state.model.data?.leads![index].id);
                              print(state.model.data!.leads![index]);
                              return LeedFullWidget(
                                  model: state.model.data!.leads![index]);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemCount: state.model.data!.leads!.length);
                      } else {
                        return const LeadsEmptyWidget();
                      }
                    } else if (state is ShowLeadsfailure) {
                      return Center(
                        child: Text(state.errormsq),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ));
        },
      ),
    );
  }
}
