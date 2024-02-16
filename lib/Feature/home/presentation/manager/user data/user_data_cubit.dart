import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/local/cache_Helper.dart';
import 'package:tqniaapp/Feature/home/data/model/user_model/user_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/user%20data/user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.repo) : super(UserDataInitial());
  static UserDataCubit get(context) => BlocProvider.of(context);
  final HomeRepo repo;
  UserModel? model;

  Future<void> updateUserData({
    required String fname,
    required String lname,
    required String mobile,
    required String password,
  }) async {
    emit(UpdateUserDataLoading());
    var res = await repo.editUserData(
        fname: fname, lname: lname, mobile: mobile, password: password);
    res.fold((l) {
      emit(UpdateUserDataFailure(l.msq.toString()));
    }, (r) {
      emit(UpdateUserDataSucc(r));
      getUserData();
    });
  }

  Future<void> getUserData() async {
    print("siuadsuioasuiouioasuiofuiouiafidji");
    emit(GetUserDataLoading());
    var res = await repo.getUserData();
    res.fold((f) => emit(GetUserDataFailure(f.msq)), (usermodel) {
      model = usermodel;
      USERID = usermodel.data!.user!.id;
      print(USERID);
      CacheHelper.saveData(key: 'userId', value: USERID).then((value) {
        emit(GetUserDataSucc(usermodel));
      });
    });
  }

  Future<void> UpdateImage({required File image}) async {
    emit(UpdateUserImageLoading());
    var res = await repo.editUserImage(image: image);
    res.fold((l) {
      emit(UpdateUserImageFailure(l.msq.toString()));
    }, (r) {
      emit(UpdateUserImageSucc(r));
      getUserData();
    });
  }
}
