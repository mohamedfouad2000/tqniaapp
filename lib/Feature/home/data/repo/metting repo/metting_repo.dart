import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/all_clients_model/all_clients_model.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/metting_model.dart';

abstract class MettingRepo {
  Future<Either<Failure, MettingModel>> getMetting(
      {required String start, required String end});
  Future<Either<Failure, String>> addMettingForm({
    required String title,
    required String description,
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
}
