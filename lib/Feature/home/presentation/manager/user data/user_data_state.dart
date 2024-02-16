import 'package:tqniaapp/Feature/home/data/model/user_model/user_model.dart';

sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class GetUserDataLoading extends UserDataState {}

final class GetUserDataSucc extends UserDataState {
  final UserModel model;
  GetUserDataSucc(this.model);
}

final class GetUserDataFailure extends UserDataState {
  final String ErrorMsq;
  GetUserDataFailure(this.ErrorMsq);
}

final class UpdateUserDataLoading extends UserDataState {}

final class UpdateUserDataSucc extends UserDataState {
  final String txt;
  UpdateUserDataSucc(this.txt);
}

final class UpdateUserDataFailure extends UserDataState {
  final String ErrorMsq;
  UpdateUserDataFailure(this.ErrorMsq);
}

final class UpdateUserImageLoading extends UserDataState {}

final class UpdateUserImageSucc extends UserDataState {
  final String txt;
  UpdateUserImageSucc(this.txt);
}

final class UpdateUserImageFailure extends UserDataState {
  final String ErrorMsq;
  UpdateUserImageFailure(this.ErrorMsq);
}
