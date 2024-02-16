import 'package:tqniaapp/Feature/home/data/model/all_clients_model/all_clients_model.dart';

sealed class AllClientState {}

final class AllClientInitial extends AllClientState {}

final class ClientsLoading extends AllClientState {}

final class ClientsSucc extends AllClientState {
  final AllClientsModel Model;

  ClientsSucc({required this.Model});
}

final class Clientsfail extends AllClientState {
  final String errormsq;

  Clientsfail({required this.errormsq});
}
