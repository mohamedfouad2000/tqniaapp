import 'lead.dart';

class Data {
  List<Lead>? leads;

  Data({this.leads});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        leads: (json['leads'] as List<dynamic>?)
            ?.map((e) => Lead.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'leads': leads?.map((e) => e.toJson()).toList(),
      };
}
