import 'package:tqniaapp/Feature/home/data/model/all_clients_model/all_clients_model.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/metting_model.dart';

sealed class MettingsState {}

final class MettingsInitial extends MettingsState {}

final class GetMettingsLoading extends MettingsState {}

final class GetMettingsSucc extends MettingsState {
  final MettingModel model;

  GetMettingsSucc({required this.model});
}

final class GetMettingsfail extends MettingsState {
  final String errormsq;

  GetMettingsfail({required this.errormsq});
}

final class AddMettingLoading extends MettingsState {}

final class AddMettingSucc extends MettingsState {
  final String txt;

  AddMettingSucc({required this.txt});
}

final class AddMettingfail extends MettingsState {
  final String errormsq;

  AddMettingfail({required this.errormsq});
}

final class getAllClientsLoading extends MettingsState {}

final class getAllClientsSucc extends MettingsState {
  final AllClientsModel Model;

  getAllClientsSucc({required this.Model});
}

final class getAllClientsfail extends MettingsState {
  final String errormsq;

  getAllClientsfail({required this.errormsq});
}
