
import 'package:tqniaapp/Feature/home/data/model/tickets_model/tickets_model.dart';

abstract class ShowTicketsState {}

final class ShowTicketsInitial extends ShowTicketsState {}


final class GetTicketsListloading extends ShowTicketsState {}

final class GetTicketsListSucc extends ShowTicketsState {
  final TicketsModel model;
  GetTicketsListSucc(this.model);
}

final class GetTicketsListFailuire extends ShowTicketsState {
  final String errorMsq;

  GetTicketsListFailuire({required this.errorMsq});
}

