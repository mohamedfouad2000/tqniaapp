import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/all_clients_model/all_clients_model.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/metting_model.dart';

abstract class MettingRepo {
  Future<Either<Failure, MettingModel>> getMetting(
      {required String start, int leadid = 0, required String end});
  Future<Either<Failure, String>> addMettingForm({
    required String title,
    required String description,
    int leadid = 0,
    required String shareWith,
    required String labels,
    required String color,
    required String location,
    required int id,
    required String start_date,
    required String end_time,
    required String startTime,
    required String enddate,
  });
  Future<Either<Failure, AllClientsModel>> getAllClients();
  Future<Either<Failure, String>> setStatusOfMeeting(
      {required int id, required String status});

  Future<Either<Failure, String>> getCommonColor();
  Future<Either<Failure, Meeting>> getTicketWithId({required int id});
}

//https://system.tqnia.me/index.php/
