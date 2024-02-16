import 'assgin_to.dart';

class Data {
  List<AssginTo>? assginTo;

  Data({this.assginTo});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        assginTo: (json['assgin_to'] as List<dynamic>?)
            ?.map((e) => AssginTo.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'assgin_to': assginTo?.map((e) => e.toJson()).toList(),
      };
}
