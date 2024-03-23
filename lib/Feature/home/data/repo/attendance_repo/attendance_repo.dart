import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/attendance_model/attendance_model.dart';

abstract class AttendanceRepo {
  Future<Either<Failure, String>> setAttendance({
    required String date,
    required String time,
    required double longitude,
    required double latitude,
    required bool isIn,
  });
  Future<Either<Failure, AttendanceModel>> getAttendance();
}
