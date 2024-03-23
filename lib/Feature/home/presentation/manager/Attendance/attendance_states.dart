import 'package:tqniaapp/Feature/home/data/model/attendance_model/attendance_model.dart';

sealed class AttendanceState {}

final class AttendanceInitial extends AttendanceState {}

final class GetAttendanceLoading extends AttendanceState {}

final class GetAttendanceSucc extends AttendanceState {
  final AttendanceModel model;
  GetAttendanceSucc(this.model);
}

final class GetAttendanceError extends AttendanceState {
  final String error;
  GetAttendanceError(this.error);
}


final class SetAttendanceLoading extends AttendanceState {}

final class SetAttendanceSucc extends AttendanceState {
  final String id;
  SetAttendanceSucc(this.id);
}

final class SetAttendanceError extends AttendanceState {
  final String error;
  SetAttendanceError(this.error);
}