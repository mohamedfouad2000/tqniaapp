import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/home/data/model/notification_model/notification_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/notification_repo/notification_repo.dart';

class NotificationRepoImp extends NotificationRepo {
  @override
  Future<Either<Failure, NotificationModel>> getNotification() async {
    try {
      NotificationModel model;
      print('siu');
      Response<dynamic> res =
          await DioHelper.getData(url: getNotificationEndPoint, query: {
        'token': TOKEN,
        'offset': '',
        'limit':30,
      });
      print('ahahshdhuaud');
      print(res.data);
      if (res.data['status'] == 200) {
        model = NotificationModel.fromJson(res.data);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getNotificationCount() async {
    try {
      print('siu');
      print("In Notification");
      Response<dynamic> res =
          await DioHelper.getData(url: getNotificationCountEndPoint, query: {
        'token': TOKEN,
      });
      print(res.data);
      print('/**//*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/**/${res.data['data']['count']}');
      if (res.data['status'] == 200) {
        return right(res.data['data']['count']);
      } else {
        return left(ServerFailure(msq: res.data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> MakeNotificationRead(
      {required int id}) async {
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: setNotificationAsReedEndPoint, query: {
        'token': TOKEN,
        'notification_id': id == 0 ? '' : id,
      });
      print(res.data);
      if (res.data['status'] == 200) {
        return right(res.data['message']);
      } else {
        return left(ServerFailure(msq: res.data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteNotificationById({
    required int id,
  }) async {
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: deleteNotificationEndPoint, query: {
        'token': TOKEN,
        'notification_id': id == 0 ? '' : id,
      });
      print(res.data);
      if (res.data['status'] == 200) {
        return right(res.data['message']);
      } else {
        return left(ServerFailure(msq: res.data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}
