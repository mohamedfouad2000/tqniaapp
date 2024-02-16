import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Feature/home/data/model/all_clients_model/all_clients_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_state.dart';

class MettingsCubit extends Cubit<MettingsState> {
  MettingsCubit(this.repo) : super(MettingsInitial());
  static MettingsCubit get(context) => BlocProvider.of(context);
  AllClientsModel? model;
  final MettingRepo repo;
  Future<void> getMetting({required String start, required String end}) async {
    emit(GetMettingsLoading());
    var res = await repo.getMetting(start: start, end: end);
    print(start);
    print(end);
    res.fold((l) {
      emit(GetMettingsfail(errormsq: l.msq));
    }, (r) {
      METTINGS = r;
      emit(GetMettingsSucc(model: r));
    });
  }

  Future<void> addMetting(
      {required String title,
      required String description,
      required String labels,
      required String color,
      required String location,
      required int id,
      required String start_date,
      required String end_time,
      required String startTime,
      required String enddate,
      required String shareWith}) async {
    emit(AddMettingLoading());

    var res = await repo.addMettingForm(
        title: title,
        description: description,
        labels: labels,
        color: color,
        location: location,
        id: id,
        start_date: start_date,
        end_time: end_time,
        startTime: startTime,
        shareWith: shareWith,
        enddate: enddate);
    res.fold((l) {
      emit(AddMettingfail(errormsq: l.msq));
    }, (r) {
      emit(AddMettingSucc(txt: r));
    });
  }

  Future<void> getAllClients() async {
    emit(getAllClientsLoading());
    var res = await repo.getAllClients();
    res.fold((l) {
      emit(getAllClientsfail(errormsq: l.msq));
    }, (r) {
      model = r;
      emit(getAllClientsSucc(Model: r));
    });
  }
}
