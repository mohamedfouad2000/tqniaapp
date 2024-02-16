import 'data.dart';

class NotificationModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  NotificationModel({this.status, this.success, this.message, this.data});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
