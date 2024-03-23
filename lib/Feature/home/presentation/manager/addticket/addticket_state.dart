import 'package:tqniaapp/Feature/home/data/model/ticket_item_model/ticket_item_model.dart';

sealed class AddticketState {}

final class AddticketInitial extends AddticketState {}

final class GetLabelsloading extends AddticketState {}

final class GetLabelsSucc extends AddticketState {}

final class GetLabelsFailure extends AddticketState {
  final String errorMsq;

  GetLabelsFailure({required this.errorMsq});
}

final class GetClientsloading extends AddticketState {}

final class GetClientsSucc extends AddticketState {}

final class GetClientsFailuire extends AddticketState {
  final String errorMsq;

  GetClientsFailuire({required this.errorMsq});
}

final class GetAssignToloading extends AddticketState {}

final class GetAssignToSucc extends AddticketState {}

final class GetAssignToFailuire extends AddticketState {
  final String errorMsq;

  GetAssignToFailuire({required this.errorMsq});
}

final class GetProjectsloading extends AddticketState {}

final class GetProjectsSucc extends AddticketState {}

final class GetProjectsFailuire extends AddticketState {
  final String errorMsq;

  GetProjectsFailuire({required this.errorMsq});
}

final class GetRequestedByloading extends AddticketState {}

final class GetRequestedBySucc extends AddticketState {}

final class GetRequestedByFailuire extends AddticketState {
  final String errorMsq;

  GetRequestedByFailuire({required this.errorMsq});
}

final class GetTicketsTypeloading extends AddticketState {}

final class GetTicketsTypeSucc extends AddticketState {}

final class GetTicketsTypeFailuire extends AddticketState {
  final String errorMsq;

  GetTicketsTypeFailuire({required this.errorMsq});
}

final class AddTicketloading extends AddticketState {}

final class AddTicketSucc extends AddticketState {
  final int id;
  AddTicketSucc(this.id);
}

final class AddTicketFailuire extends AddticketState {
  final String errorMsq;

  AddTicketFailuire({required this.errorMsq});
}

final class GetticketByIdloading extends AddticketState {}

final class GetticketByIdSucc extends AddticketState {
  final TicketItemModel model;
  GetticketByIdSucc(this.model);
}

final class GetticketByIdFailuire extends AddticketState {
  final String errorMsq;

  GetticketByIdFailuire({required this.errorMsq});
}

final class CheckPermisionloading extends AddticketState {}

final class CheckPermisionSucc extends AddticketState {
  final String msq;
  CheckPermisionSucc(this.msq);
}

final class CheckPermisionFailuire extends AddticketState {
  final String errorMsq;

  CheckPermisionFailuire({required this.errorMsq});
}

final class AddCommentloading extends AddticketState {}

final class AddCommentSucc extends AddticketState {
  final String msq;
  AddCommentSucc(this.msq);
}

final class AddCommentFailuire extends AddticketState {
  final String errorMsq;

  AddCommentFailuire({required this.errorMsq});
}

final class GetAllFiledloading extends AddticketState {}

final class GetAllFiledSucc extends AddticketState {}

final class GetAllFiledFailuire extends AddticketState {
  final String errorMsq;

  GetAllFiledFailuire({required this.errorMsq});
}
