import 'lead.dart';

class Data {
  List<Lead>? leads;
  dynamic count;

  Data({this.leads, this.count});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json['count'],
        leads: (json['leads'] as List<dynamic>?)
            ?.map((e) => Lead.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() =>
      {'leads': leads?.map((e) => e.toJson()).toList(), 'count': count};
}
