import 'data.dart';

class NotesModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  NotesModel({this.status, this.success, this.message, this.data});

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
        status: json['status'] as int?,
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
