import 'package:tqniaapp/Feature/home/data/model/reminder_model/reminder_model.dart';

sealed class ReminderState {}

final class ReminderInitial extends ReminderState {}

final class GetReminderLoading extends ReminderState {}

final class GetReminderSucc extends ReminderState {
  final ReminderModel model;
  GetReminderSucc(this.model);
}

final class GetReminderFailure extends ReminderState {
  final String errormsq;
  GetReminderFailure(this.errormsq);
}

final class AddReminderLoading extends ReminderState {}

final class AddReminderSucc extends ReminderState {
  final int id;
  AddReminderSucc(this.id);
}

final class AddReminderFailure extends ReminderState {
  final String errormsq;
  AddReminderFailure(this.errormsq);
}

final class MakeRemiderIsDoneLoading extends ReminderState {}

final class MakeRemiderIsDoneSucc extends ReminderState {
  final String txt;
  MakeRemiderIsDoneSucc(this.txt);
}

final class MakeRemiderIsDoneFailure extends ReminderState {
  final String errormsq;
  MakeRemiderIsDoneFailure(this.errormsq);
}

final class DeleteReminderLoading extends ReminderState {}

final class DeleteReminderSucc extends ReminderState {
  final String txt;
  DeleteReminderSucc(this.txt);
}

final class DeleteReminderFailure extends ReminderState {
  final String errormsq;
  DeleteReminderFailure(this.errormsq);
}
