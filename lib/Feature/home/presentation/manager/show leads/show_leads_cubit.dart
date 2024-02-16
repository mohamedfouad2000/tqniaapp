import 'package:bloc/bloc.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/show%20leads/show_leads_state.dart';

class ShowLeadsCubit extends Cubit<ShowLeadsState> {
  ShowLeadsCubit(this.homeRepo) : super(ShowLeadsInitial());
  final HomeRepo homeRepo;
  Future<void> getHomeLeads() async {
    emit(ShowLeadsloading());
    var result = await homeRepo.getHomeLeads();
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
