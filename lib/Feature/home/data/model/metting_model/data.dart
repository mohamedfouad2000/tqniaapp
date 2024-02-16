import 'meeting.dart';

class Data {
  List<Meeting>? meeting;

  Data({this.meeting});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        meeting: (json['meeting'] as List<dynamic>?)
            ?.map((e) => Meeting.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'meeting': meeting?.map((e) => e.toJson()).toList(),
      };
}
