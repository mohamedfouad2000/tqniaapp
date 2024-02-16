import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/client_model/client_model.dart';
import 'package:tqniaapp/Feature/home/data/model/get_ticket_type/get_ticket_type.dart';
import 'package:tqniaapp/Feature/home/data/model/label_model/label_model.dart';
import 'package:tqniaapp/Feature/home/data/model/ticket_item_model/ticket_item_model.dart';
import 'package:tqniaapp/Feature/home/data/model/tickets_model/ticket.dart';
import 'package:tqniaapp/Feature/home/data/model/tickets_model/tickets_model.dart';

abstract class AddTicketRepo {
  Future<Either<Failure, LabelModel>> getlabels();
  Future<Either<Failure, List<ClientModel>>> getclients();
  Future<Either<Failure, List<TicketType>>> getTicketsTypes();
  Future<Either<Failure, TicketsModel>> getTicketsList();
  Future<Either<Failure, List<ClientModel>>> getRequestedBy();
  Future<Either<Failure, List<ClientModel>>> getAssginTo();
  Future<Either<Failure, List<ClientModel>>> getProjects();

  Future<Either<Failure, int>> addTicket({
    required String title,
    required String id,
    required String projectId,
    required String tickettypeid,
    required String clientid,
    required String assignedto,
    required String labels,
    required String requestedbyid,
    required String description,
    required File file,
  });
  Future<Either<Failure, TicketItemModel>> geTicketById({required int id});
  Future<Either<Failure, String>> checkAddTicketPermission({required int id});
}
