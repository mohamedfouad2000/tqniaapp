import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/login/data/models/login_model/login_model.dart';
import 'package:tqniaapp/Feature/login/presentation/manger/LoginCubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> signIn({required String email, required String password}) async {
    LoginModel? list;
    emit(SignInLoading());
    try {
      Response<dynamic> res = await DioHelper.getDataWhenLogin(
        url: '$LOGINURlEndPoint?email=$email&password=$password',
      );
      list = LoginModel.fromJson(res.data);
      if (list.status == 200) {
        emit(SignInSucc(model: list));
      } else {
        emit(SignInFailure(errorMessage: list.message.toString()));
      }
    } catch (e) {
      if (e is DioException) {
        var x = ServerFailure.fromDioError(e);
        emit(SignInFailure(errorMessage: x.msq.toString()));
      } else {
        emit(SignInFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    print('ahahhasuhduhasduhhasuidhuasuhduhafua');
    emit(ResetPasswordLoading());

    try {
      Response<dynamic> res = await DioHelper.getDataWhenLogin(
        url: '$sendresetpasswordEndPoint?email=$email',
      );
      print(res.data);
      if (res.data['status'] == 200) {
        emit(ResetPasswordSucc(Message: res.data['message']));
      } else {
        emit(
            ResetPasswordFailure(errorMessage: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        var x = ServerFailure.fromDioError(e);
        emit((ResetPasswordFailure(errorMessage: x.msq.toString())));
      } else {
        emit(ResetPasswordFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<void> doResetPassword({
    required String key,
    required String password,
  }) async {
    emit(sendCodeLoading());

    try {
      Response<dynamic> res = await DioHelper.getDataWhenLogin(
        url: '$doresetpasswordEndPoint?password=$password&key=$key',
      );
      print(res.data);
      if (res.data['status'] == 200) {
        emit(sendCodeSucc(Message: res.data['massage']));
      } else {
        emit(sendCodeFailure(errorMessage: 'Try Again!'));
      }
    } catch (e) {
      emit(sendCodeFailure(errorMessage: e.toString()));
    }
  }
}
