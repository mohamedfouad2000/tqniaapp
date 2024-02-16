import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';

sealed class LeadsInfoState {}

final class LeadsInfoInitial extends LeadsInfoState {}

final class getLeadByIdLoading extends LeadsInfoState {}

final class getLeadByIdSucc extends LeadsInfoState {
  final Lead model;
  getLeadByIdSucc(this.model);
}

final class getLeadByIdfalilure extends LeadsInfoState {
  final String errormsq;
  getLeadByIdfalilure(this.errormsq);
}

final class deleteLeadLoading extends LeadsInfoState {}

final class deleteLeadSucc extends LeadsInfoState {
  final String msq;

  deleteLeadSucc(this.msq);
}

final class deleteLeadfalilure extends LeadsInfoState {
  final String errormsq;
  deleteLeadfalilure(this.errormsq);
}
