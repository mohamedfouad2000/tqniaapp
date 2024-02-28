import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/home/data/model/all_clients_model/all_clients_model.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/meeting.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/metting_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/metting%20repo/metting_repo.dart';

class MettingRepoImp extends MettingRepo {
  @override
  Future<Either<Failure, MettingModel>> getMetting(
      {required String start, int leadid = 0, required String end}) async {
    MettingModel model;

    try {
      print("object is //////////////////////////////// $leadid");
      print(TOKEN);
      print(USERID);
      Response<dynamic> res = await DioHelper.getData(
          url: ApiGetAllEventEndPoint,
          query: {
            'token': TOKEN,
            if (leadid != 0) 'client_id': leadid,
            'start': start,
            'end': end
          });
      print(res.data);
      if (res.data['status'] == 200) {
        model = MettingModel.fromJson(res.data);
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
  Future<Either<Failure, String>> addMettingForm(
      {required String title,
      required String description,
      int leadid=0,
      required String labels,
      required String shareWith,
      required int id,
      required String color,
      required String location,
      required String start_date,
      required String end_time,
      required String startTime,
      required String enddate}) async {
    try {
      print(TOKEN);
      print(USERID);
      Response<dynamic> res = await DioHelper.postData(
          url: CreateEventEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            'start_date': start_date,
            if(leadid!=0) 'client_id':leadid,
            'description': description,
            'title': title,
            'start_time': startTime,
            'end_date': enddate,
            'location': location,
            'end_time': end_time,
            'labels': labels,
            'color': color,
            'id': id == 0 ? '' : id,
            'share_with': shareWith
          }));
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
  Future<Either<Failure, AllClientsModel>> getAllClients() async {
    try {
      AllClientsModel model;
      print(TOKEN);
      print(USERID);
      Response<dynamic> res =
          await DioHelper.getData(url: getallcontactsEndPoint, query: {
        'token': TOKEN,
      });
      print(res.data);
      if (res.data['status'] == 200) {
        model = AllClientsModel.fromJson(res.data);
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
  Future<Either<Failure, String>> setStatusOfMeeting(
      {required int id, required String status}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: saveEventStatusEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            'meeting_id': id,
            'status': status,
          }));
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
  Future<Either<Failure, String>> getCommonColor() async {
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: getCommonColorEndPoint, query: {
        'token': TOKEN,
      });

      if (res.data['status'] == 200) {
        return right(res.data['data']['color'].toString());
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
  Future<Either<Failure, Meeting>> getTicketWithId({required int id}) async {
    Meeting? model;
    try {
      Response<dynamic> res = await DioHelper.getData(
          url: getMeetingByIdEndPoint, query: {'token': TOKEN, 'id': id});

      if (res.data['status'] == 200) {
        model = Meeting.fromJson(res.data['data']);
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
}
