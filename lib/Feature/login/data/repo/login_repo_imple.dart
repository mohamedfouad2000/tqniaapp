import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/login/data/models/login_model/login_model.dart';
import 'package:tqniaapp/Feature/login/data/repo/login_repo.dart';

class LoginRepoImp extends LoginRepo {
  @override
  Future<Either<Failure, LoginModel>> signIn(
      {required String email, required String password}) async {
    LoginModel? list;
    try {
      Response<dynamic> res = await DioHelper.getData(
        url: '$LOGINURlEndPoint?email=$email&password=$password',
      );
      list = LoginModel.fromJson(res.data);
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}
