import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/login/data/models/login_model/login_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> signIn(
      {required String email, required String password});
}
