import 'package:bloc/bloc.dart';

import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/All%20Client/all_client_state.dart';

class AllClientCubit extends Cubit<AllClientState> {
  AllClientCubit(this.repo) : super(AllClientInitial());
  final MettingRepo repo;
  Future<void> getAllClients() async {
    emit(ClientsLoading());
    var res = await repo.getAllClients();
    res.fold((l) {
      emit(Clientsfail(errormsq: l.msq));
    }, (r) {
      emit(ClientsSucc(Model: r));
    });
  }
}
