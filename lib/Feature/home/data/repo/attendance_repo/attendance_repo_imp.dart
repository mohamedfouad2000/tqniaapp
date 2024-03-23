import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/home/data/model/attendance_model/attendance_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/attendance_repo/attendance_repo.dart';

class AttendanceRepoImp extends AttendanceRepo {
  @override
  Future<Either<Failure, AttendanceModel>> getAttendance() async {
    AttendanceModel model = AttendanceModel();
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: getAttendaceEndPoint, query: {
        'token': TOKEN,
      });
      print(res.data);
      if (res.data['status'] == 200) {
        if (res.data['clock_out'] == 0) {
          model = AttendanceModel.fromJson(res.data);
        }
        return right(model);
      } else {
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
  Future<Either<Failure, String>> setAttendance(
      {required String date,
      required String time,
      required double longitude,
      required bool isIn,
      required double latitude}) async {
    try {
      print(' Siu Siu  $date $time $longitude $isIn $id $latitude');
      Response<dynamic> res =
          await DioHelper.getData(url: setAttendaceEndPoint, query: {
        'token': TOKEN,
        'in_date': date,
        'in_time': time,
        'longitude': longitude,
        'latitude': latitude,
        'out_date': date,
        'out_time': time,
      });
      // print(res.data);
      if (res.data['status'] == 200) {
        return right(res.data['data']['id_for_clock_out'].toString());
      } else {
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
