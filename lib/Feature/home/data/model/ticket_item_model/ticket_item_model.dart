import 'data.dart';

class TicketItemModel {
  int? status;
  bool? success;
  String? message;
  Data? data;

  TicketItemModel({this.status, this.success, this.message, this.data});

  factory TicketItemModel.fromJson(Map<String, dynamic> json) {
    return TicketItemModel(
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
