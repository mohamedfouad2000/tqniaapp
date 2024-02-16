import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tqniaapp/Feature/home/data/repo/add_calls_repo/add_calls_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/add%20calls/add_calls_state.dart';

class AddCallsCubit extends Cubit<AddCallsState> {
  AddCallsCubit(this.repo) : super(AddCallsInitial());
  static AddCallsCubit get(context) => BlocProvider.of(context);
  final AddCallsRep repo;
  Future<void> addCall({
    required String id,
    required String status,
    required String notes,
    required String description,
    required String date,
  }) async {
    emit(AddnewCallsLoading());
    var res = await repo.addCalls(
        date: date,
        id: id,
        status: status,
        notes: notes,
        description: description);

    res.fold((l) {
      emit(AddnewCallsfail(eroorMsq: l.msq.toString()));
    }, (r) {
      emit(AddnewCallsSucc(id: r));
    });
  }

  Future<void> getCalls() async {
    emit(GetCallsLoading());
    var res = await repo.getCalls();
    res.fold((failure) => emit(GetCallsfail(eroorMsq: failure.msq.toString())),
        (r) {
      emit(GetCallsSucc(model: r));
    });
  }
}
