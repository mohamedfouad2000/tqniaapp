import 'datum.dart';

class AllClientsModel {
  int? status;
  bool? success;
  String? message;
  List<Datum>? data;

  AllClientsModel({this.status, this.success, this.message, this.data});

  factory AllClientsModel.fromJson(Map<String, dynamic> json) {
    return AllClientsModel(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
