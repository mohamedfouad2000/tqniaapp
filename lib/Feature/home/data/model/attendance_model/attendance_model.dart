import 'data.dart';

class AttendanceModel {
  int? status;
  bool? success;
  String? message;
  Data? data;
  int? clockOut;

  AttendanceModel({
    this.status,
    this.success,
    this.message,
    this.data,
    this.clockOut,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      clockOut: json['clock_out'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'message': message,
        'data': data?.toJson(),
        'clock_out': clockOut,
      };
}
