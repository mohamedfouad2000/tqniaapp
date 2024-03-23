import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/widgets/custom_loading_widget.dart';
import 'package:tqniaapp/Core/widgets/loading/home_lead_loading.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leads_widget.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/view_all_leads_list.dart';

class ViewAllLeadsScreen extends StatefulWidget {
  const ViewAllLeadsScreen({super.key});

  @override
  State<ViewAllLeadsScreen> createState() => _ViewAllLeadsScreenState();
}

class _ViewAllLeadsScreenState extends State<ViewAllLeadsScreen> {
  List<Lead> leadsList = [];
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowLeadsCubit(HomeRepoImp())
        ..getHomeLeads(date: '', source: '', status: '', search: ''),
      child: BlocConsumer<ShowLeadsCubit, ShowLeadsState>(
        listener: (context, state) {
          if (state is ShowLeadssucc) {
            leadsList.addAll(state.model.data!.leads!);
          }
        },
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
                    if (state is ShowLeadssucc ||
                        state is ShowLeadsPagginationloading) {
                      if (leadsList.isNotEmpty) {
                        if (state is ShowLeadssucc) {
                          if (state.model.data!.leads!.isEmpty) {
                            isEmpty = true;
                          }
                        }
                        return ViewAllLeadsList(
                          leads: leadsList,
                          isEmpty: isEmpty,
                        );
                      } else {
                        return const LeadsEmptyWidget();
                      }
                    } else if (state is ShowLeadsfailure) {
                      return Center(
                        child: Text(state.errormsq),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                         return const CustomLoadingWidget(child: HomeLeadLoading());
                         
                      });
                      
                    }
                  },
                ),
              ));
        },
      ),
    );
  }
}
