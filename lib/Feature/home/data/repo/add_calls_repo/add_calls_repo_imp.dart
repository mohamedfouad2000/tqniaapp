import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/home/data/model/calls_model/calls_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_calls_repo/add_calls_repo.dart';

class AddCallsRepoImp extends AddCallsRep {
  @override
  Future<Either<Failure, int>> addCalls(
      {required String id,
      required String status,
      required String date,
      required String notes,
      required String description}) async {
    try {
      print(id);
      print(status);
      print(date);
      print(notes);
      print(description);

      Response<dynamic> res = await DioHelper.postData(
          url: AddcallEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            'id': id,
            'notes': notes,
            'description': description,
            'client_id': USERID,
            'status': status,
            'date': date
          }));

      print(res.data);
      print("object");
      if (res.data["status"] == 200) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        print(res.data["data"]['id']);
        return right(int.parse(res.data["data"]['id'].toString()));
      } else {
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CallsModel>> getCalls() async {
    CallsModel? model;
    print(TOKEN);
    print(USERID);

    try {
      Response<dynamic> res =
          await DioHelper.getData(url: getCallsEndPoint, query: {
        'token': TOKEN,
        'client_id': USERID,
      });

      print(res.data);
      if (res.data['status'] == 200) {
        model = CallsModel.fromJson(res.data);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}
