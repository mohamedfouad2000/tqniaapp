import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Leads%20Info/leads_info_state.dart';

class LeadsInfoCubit extends Cubit<LeadsInfoState> {
  LeadsInfoCubit(this.homerepo) : super(LeadsInfoInitial());
  final HomeRepo homerepo;
  static LeadsInfoCubit get(context) => BlocProvider.of(context);
  Future<void> getLeadById({required int id}) async {
    emit(getLeadByIdLoading());
    var res = await homerepo.geLeadById(id: id);
    res.fold((f) {
      emit(getLeadByIdfalilure(f.toString()));
    }, (model) {
      editModel = model;
      emit(getLeadByIdSucc(model));
    });
  }

  Future<void> delateleadById({required int id}) async {
    emit(deleteLeadLoading());
    var res = await homerepo.delateLead(id: id);
    res.fold((f) {
      emit(deleteLeadfalilure(f.toString()));
    }, (model) {
      emit(deleteLeadSucc(model));
    });
  }


}
