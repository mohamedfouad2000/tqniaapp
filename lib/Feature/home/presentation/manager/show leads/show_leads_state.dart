import 'package:tqniaapp/Feature/home/data/model/lead_model/lead_model.dart';

sealed class ShowLeadsState {}

final class ShowLeadsInitial extends ShowLeadsState {}

final class ShowLeadsloading extends ShowLeadsState {}

final class ShowLeadssucc extends ShowLeadsState {
  final LeadModel model;

  ShowLeadssucc({required this.model});
}

final class ShowLeadsfailure extends ShowLeadsState {
  final String errormsq;

  ShowLeadsfailure({required this.errormsq});
}
