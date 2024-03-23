import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/reminder_model/reminder_model.dart';

abstract class ReminderRepo {
  Future<Either<Failure, ReminderModel>> getReminders();
  Future<Either<Failure, int>> addReminders({
    required String title,
    required String startDate,
    required String startTime,
  });
  Future<Either<Failure, String>> makeReminderDone({required int id});
  Future<Either<Failure, String>> deleteReminder({required int id});
}
