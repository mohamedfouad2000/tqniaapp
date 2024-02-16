import 'datum.dart';

class Siusiu {
  int? status;
  bool? success;
  String? message;
  List<Datum>? data;

  Siusiu({this.status, this.success, this.message, this.data});

  factory Siusiu.fromJson(Map<String, dynamic> json) => Siusiu(
        status: json['status'] as int?,
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
