import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Feature/home/data/model/all_clients_model/all_clients_model.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/metting_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/mettings/mettings_state.dart';

class MettingsCubit extends Cubit<MettingsState> {
  MettingsCubit(this.repo) : super(MettingsInitial());
  static MettingsCubit get(context) => BlocProvider.of(context);
  AllClientsModel? model;
  final MettingRepo repo;
  String? commonColor;
  List<Meeting> modelToday = [];
  Future<void> getMetting(
      {required String start,
      required String end,
      int leadid = 0,
      bool isGetDataToday = false}) async {
    emit(GetMettingsLoading());
    var res = await repo.getMetting(start: start, end: end, leadid: leadid);
    print(start);
    print(end);
    res.fold((l) {
      emit(GetMettingsfail(errormsq: l.msq));
    }, (r) async {
      METTINGS = r;
      if (isGetDataToday) {
        await getDataToday(mettingModel: r).then((value) {
          emit(GetMettingsSucc(model: r));
        });
      } else {
        emit(GetMettingsSucc(model: r));
      }
    });
  }

  Future<void> addMetting(
      {required String title,
      required String description,
      required String labels,
      int leadid = 0,
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
        leadid: leadid,
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
      getCommonColor().then((value) => {emit(getAllClientsSucc(Model: r))});
    });
  }

  Future<void> getDataToday({required MettingModel? mettingModel}) async {
    mettingModel?.data?.meeting?.forEach((element) {
      if (element.startDate ==
          (DateFormat('yyyy-MM-dd').format(DateTime.now()).toString())) {
        modelToday.add(element);
      }
    });
  }

  Future<void> setMettingStatus(
      {required int id, required String status}) async {
    emit(SetMeetingStatusLoading());
    var res = await repo.setStatusOfMeeting(id: id, status: status);
    res.fold((l) {
      emit(SetMeetingStatusfail(errormsq: l.msq));
    }, (r) {
      emit(SetMeetingStatusSucc(txt: r.toString()));
    });
  }

  Future<void> getCommonColor() async {
    var res = await repo.getCommonColor();
    res.fold((l) => print(l.msq.toString()), (r) => commonColor = r);
  }

  Future<void> getMettingbyId({required int id}) async {
    emit(GetMeetingByIdLoading());
    var res = await repo.getTicketWithId(
      id: id,
    );
    res.fold((l) {
      emit(GetMeetingByIdfail(errormsq: l.msq));
    }, (r) {
      emit(GetMeetingByIdSucc(model: r));
    });
  }
}
