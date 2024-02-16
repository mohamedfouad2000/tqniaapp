import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/calls_model/calls_model.dart';

abstract class AddCallsRep {
  Future<Either<Failure, CallsModel>> getCalls();
  Future<Either<Failure, int>> addCalls({
    required String id,
    required String status,
    required String notes,
    required String description,
    required String date,
  });
}
