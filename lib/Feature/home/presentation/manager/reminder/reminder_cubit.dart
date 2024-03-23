import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/repo/Reminders_repo/reminder_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/reminder/reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  ReminderCubit(this.repo) : super(ReminderInitial());
  final ReminderRepo repo;
  Future<void> getReminder() async {
    emit(GetReminderLoading());
    var res = await repo.getReminders();
    res.fold((l) {
      emit(GetReminderFailure(l.msq.toString()));
    }, (r) {
      emit(GetReminderSucc(r));
    });
  }

  Future<void> addReminder({
    required String startDate,
    required String startTime,
    required String title,
  }) async {
    emit(AddReminderLoading());
    var res = await repo.addReminders(
        title: title, startDate: startDate, startTime: startTime);
    res.fold((l) {
      emit(AddReminderFailure(l.msq.toString()));
    }, (r) {
      emit(AddReminderSucc(r));
    });
  }

  Future<void> makeReminderIsDone({required int id}) async {
    emit(MakeRemiderIsDoneLoading());
    var res = await repo.makeReminderDone(id: id);
    res.fold((l) {
      emit(MakeRemiderIsDoneFailure(l.msq.toString()));
    }, (r) {
      emit(MakeRemiderIsDoneSucc(r));
    });
  }

  Future<void> deleteReminder({required int id}) async {
    emit(DeleteReminderLoading());
    var res = await repo.deleteReminder(id: id);
    res.fold((l) {
      emit(DeleteReminderFailure(l.msq.toString()));
    }, (r) {
      emit(DeleteReminderSucc(r));
    });
  }

  //ApiEvents/delete
}
