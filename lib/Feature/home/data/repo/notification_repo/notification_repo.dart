import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/notification_model/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, NotificationModel>> getNotification();
  Future<Either<Failure, int>> getNotificationCount();
  Future<Either<Failure, int>> deleteNotificationById({required int id});
  Future<Either<Failure, String>> MakeNotificationRead({required int id});
}
