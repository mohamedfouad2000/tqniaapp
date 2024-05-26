import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/views/widgets/leed_full_widget.dart';

class ViewAllLeadsList extends StatefulWidget {
  const ViewAllLeadsList({
    super.key,
    required this.leads,
    required this.isEmpty,
  });
  final List<Lead> leads;
  final bool isEmpty;

  @override
  State<ViewAllLeadsList> createState() => _ViewAllLeadsListState();
}

class _ViewAllLeadsListState extends State<ViewAllLeadsList> {
  var screollCon = ScrollController();
  int skip = 15;
  bool isLoad = false;
  @override
  void initState() {
    screollCon.addListener(pagFun);
    // TODO: implement initState
    super.initState();
  }

  void pagFun() async {
    if (screollCon.position.pixels >=
        .7 * screollCon.position.maxScrollExtent) {
      if (!isLoad) {
        isLoad = true;
        await BlocProvider.of<ShowLeadsCubit>(context).getHomeLeads(
          status: '',
          source: '',
          search: '',
          skip: skip += 15,
          date: '',
        );
        isLoad = false;
      }
    }
  }

  @override
  void dispose() {
    screollCon.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: screollCon,
        itemBuilder: (context, index) {
          return index < widget.leads.length
              ? LeedFullWidget(model: widget.leads[index])
              : Builder(builder: (context) {
                  if (!widget.isEmpty && widget.leads.length > 4) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Container();
                  }
                });
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: widget.leads.length + 1);
  }
}
