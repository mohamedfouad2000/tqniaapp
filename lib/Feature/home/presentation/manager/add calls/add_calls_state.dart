import 'package:tqniaapp/Feature/home/data/model/calls_model/calls_model.dart';

sealed class AddCallsState {}

final class AddCallsInitial extends AddCallsState {}

final class AddnewCallsLoading extends AddCallsState {}

final class AddnewCallsSucc extends AddCallsState {
  final int id;

  AddnewCallsSucc({required this.id});
}

final class AddnewCallsfail extends AddCallsState {
  final String eroorMsq;

  AddnewCallsfail({required this.eroorMsq});
}

final class GetCallsLoading extends AddCallsState {}

final class GetCallsSucc extends AddCallsState {
  final CallsModel model;

  GetCallsSucc({required this.model});
}

final class GetCallsfail extends AddCallsState {
  final String eroorMsq;

  GetCallsfail({required this.eroorMsq});
}
