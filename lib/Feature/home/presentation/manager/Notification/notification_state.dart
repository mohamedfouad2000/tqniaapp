import 'package:tqniaapp/Feature/home/data/model/notification_model/notification_model.dart';

sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class getNotificationLoading extends NotificationState {}

final class getNotificatSucc extends NotificationState {
  final NotificationModel model;

  getNotificatSucc({required this.model});
}

final class getNotificatieroor extends NotificationState {
  final String errormsq;

  getNotificatieroor({required this.errormsq});
}

final class GetNotificationCountLoading extends NotificationState {}

final class GetNotificationCountSucc extends NotificationState {
  final int count;

  GetNotificationCountSucc({required this.count});
}

final class GetNotificationCounteroor extends NotificationState {
  final String errormsq;

  GetNotificationCounteroor({required this.errormsq});
}

final class MakeNotifAsReadLoading extends NotificationState {}

final class MakeNotifAsReadSucc extends NotificationState {
  final String txt;

  MakeNotifAsReadSucc({required this.txt});
}

final class MakeNotifAsReaderoor extends NotificationState {
  final String errormsq;

  MakeNotifAsReaderoor({required this.errormsq});
}

final class DeleteNotificationByIdLoading extends NotificationState {}

final class DeleteNotificationByIdSucc extends NotificationState {
  final String txt;

  DeleteNotificationByIdSucc({required this.txt});
}

final class DeleteNotificationByIderoor extends NotificationState {
  final String errormsq;

  DeleteNotificationByIderoor({required this.errormsq});
}
