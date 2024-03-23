import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/repo/attendance_repo/attendance_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Attendance/attendance_states.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit(this.repo) : super(AttendanceInitial());
  final AttendanceRepo repo;

  Future<void> getAttendance() async {
    emit(GetAttendanceLoading());
    var res = await repo.getAttendance();
    res.fold((f) {
      emit(GetAttendanceError(f.toString()));
    }, (model) {
      emit(GetAttendanceSucc(model));
    });
  }

  Future<void> setAttendance({
    required String date,
    required String time,
    required double longitude,
    required double latitude,
    required bool isIn,

  }) async {
    emit(SetAttendanceLoading());
    var res = await repo.setAttendance(
        date: date,
        time: time,
        longitude: longitude,
        latitude: latitude,
        isIn: isIn);
    res.fold((f) {
      emit(SetAttendanceError(f.toString()));
    }, (id) {
      emit(SetAttendanceSucc(id));
      getAttendance();
    });
  }
}
