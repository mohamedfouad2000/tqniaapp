import 'call.dart';

class Data {
  List<Call>? calls;

  Data({this.calls});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        calls: (json['calls'] as List<dynamic>?)
            ?.map((e) => Call.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'calls': calls?.map((e) => e.toJson()).toList(),
      };
}
