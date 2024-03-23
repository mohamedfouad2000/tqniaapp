import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_state.dart';

class ShowLeadsCubit extends Cubit<ShowLeadsState> {
  ShowLeadsCubit(this.homeRepo) : super(ShowLeadsInitial());
  static ShowLeadsCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> getHomeLeads(
      {required String status,
      required String source,
      required String search,
      int skip = 0,
      required String date}) async {
    if (skip != 0) {
      emit(ShowLeadsPagginationloading());
    } else {
      emit(ShowLeadsloading());
    }
    var result = await homeRepo.getHomeLeads(
      status: status,
      source: source,
      skip: skip,
      date: date,
      search: search,
    );
    print('////////////*///////////////////////****************');
    result.fold((failure) {
      print(failure.msq);
      emit(ShowLeadsfailure(errormsq: failure.msq));
    }, (model) {
      print(model.data?.leads?.length);
      emit(ShowLeadssucc(model: model));
    });
  }
}
