import 'package:tqniaapp/Feature/login/data/models/login_model/login_model.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class SignInLoading extends LoginStates {}

class SignInSucc extends LoginStates {
  final LoginModel model;

  SignInSucc({required this.model});
}

class SignInFailure extends LoginStates {
  final String errorMessage;
  SignInFailure({required this.errorMessage});
}

class ResetPasswordLoading extends LoginStates {}

class ResetPasswordSucc extends LoginStates {
  final String Message;
  ResetPasswordSucc({required this.Message});
}

class ResetPasswordFailure extends LoginStates {
  final String errorMessage;
  ResetPasswordFailure({required this.errorMessage});
}

class sendCodeLoading extends LoginStates {}

class sendCodeSucc extends LoginStates {
  final String Message;
  sendCodeSucc({required this.Message});
}

class sendCodeFailure extends LoginStates {
  final String errorMessage;
  sendCodeFailure({required this.errorMessage});
}
