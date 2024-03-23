import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/home/data/model/reminder_model/reminder_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/Reminders_repo/reminder_repo.dart';

class ReminderRepoImp implements ReminderRepo {
  @override
  Future<Either<Failure, int>> addReminders({
    required String title,
    required String startDate,
    required String startTime,
  }) async {
    try {
      print(TOKEN);
      print(USERID);
      Response<dynamic> res = await DioHelper.postData(
          url: createReminderEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            'title': title,
            'start_date': startDate,
            'start_time': startTime,
          }));
      print(res.data);
      if (res.data['status'] == 200) {
        return right(res.data['data']['reminder_id']);
      } else {
        print(res.data['message'].toString());
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReminderModel>> getReminders() async {
    ReminderModel model;

    try {
      print(TOKEN);
      print(USERID);
      Response<dynamic> res =
          await DioHelper.getData(url: getAllremindersEndPoint, query: {
        'token': TOKEN,
      });
      print(res.data);
      if (res.data['status'] == 200) {
        model = ReminderModel.fromJson(res.data);
        return right(model);
      } else {
        print(res.data['message'].toString());
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> makeReminderDone({required int id}) async {
    //
    try {
      print(TOKEN);
      print(USERID);
      Response<dynamic> res = await DioHelper.getData(
          url: markAsDoneReminderEndPoint, query: {'token': TOKEN, 'id': id});
      print(res.data);
      if (res.data['status'] == 200) {
        return right(res.data['message'].toString());
      } else {
        print(res.data['message'].toString());
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteReminder({required int id}) async {
    try {
      print(TOKEN);
      print(USERID);
      Response<dynamic> res = await DioHelper.postData(
          url: deleteReminderEndPoint,
          data: FormData.fromMap({'token': TOKEN, 'id': id}));
      //   'token': TOKEN,
      //

      print(res.data);
      if (res.data['status'] == 200) {
        return right(res.data['message'].toString());
      } else {
        print(res.data['message'].toString());
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}
