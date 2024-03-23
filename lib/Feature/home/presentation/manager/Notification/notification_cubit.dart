import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/repo/notification_repo/notification_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Notification/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.repo) : super(NotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);
  final NotificationRepo repo;
  Future<void> getNotification() async {
    emit(getNotificationLoading());
    var res = await repo.getNotification();
    res.fold((l) {
      emit(getNotificatieroor(errormsq: l.msq.toString()));
    }, (r)  {
      emit(getNotificatSucc(model: r));
    });
  }


  Future<void> getNotificationCount() async {
    emit(GetNotificationCountLoading());
    var res = await repo.getNotificationCount();
    res.fold((l) {
      emit(GetNotificationCounteroor(errormsq: l.msq.toString()));
    }, (r)  {
      emit(GetNotificationCountSucc(count: r));
    });
  }

  Future<void> MakeNotificationRead({required int id}) async {
    // emit(MakeNotifAsReadLoading());
    var res = await repo.MakeNotificationRead(id: id);
    res.fold((l) {
      emit(MakeNotifAsReaderoor(errormsq: l.msq.toString()));
    }, (r) {
      // emit(MakeNotifAsReadSucc(txt: r.toString()));
    });
  }

  Future<void> setLocation({required double long, required double lat}) async {
    // emit(SetLocationLoading());
    var res = await repo.setLocation(lat: lat, long: long);
    res.fold((l) {
      emit(SetLocationeroor(errormsq: l.msq.toString()));
    }, (r) {
      emit(SetLocationSucc(txt: r.toString()));
    });
  }
}
